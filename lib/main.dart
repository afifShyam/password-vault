import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_vault/utils/index.dart';
import 'package:pass_vault/views/index.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'blocs/index.dart';
import 'services/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final env = const AppEnv();
  SupabaseClient? supabaseClient;
  SupabaseKeyRemote? keyRemote;

  if (env.hasSupabaseConfig) {
    try {
      final supabase = await Supabase.initialize(
        url: AppEnv.supabaseUrl,
        anonKey: AppEnv.supabaseAnonKey,
        authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
      );
      supabaseClient = supabase.client;
      keyRemote = SupabaseKeyRemote(supabaseClient);

      log('Supabase initialized with url: ${AppEnv.supabaseUrl}');
      final userId = supabaseClient.auth.currentUser?.id;
      log('Current Supabase user: ${userId ?? 'none'}');
    } catch (e, st) {
      log('Supabase init failed: $e', stackTrace: st);
    }
  } else {
    log('Supabase config missing; skipping remote sync');
  }

  final secureStorageService = SecureStorageService();
  final encryptionService = EncryptionService(
    secureStorageService,
    keyRemote: keyRemote,
  );

  runApp(
    PassVaultApp(
      authService: AuthService(),
      secureStorageService: secureStorageService,
      encryptionService: encryptionService,
      supabaseVaultRemote: supabaseClient != null
          ? SupabaseVaultRemote(
              client: supabaseClient,
              encryptionService: encryptionService,
            )
          : null,
    ),
  );
}

class PassVaultApp extends StatelessWidget {
  const PassVaultApp({
    super.key,
    required this.authService,
    required this.secureStorageService,
    required this.encryptionService,
    this.supabaseVaultRemote,
  });

  final AuthService authService;
  final SecureStorageService secureStorageService;
  final EncryptionService encryptionService;
  final SupabaseVaultRemote? supabaseVaultRemote;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              AuthBloc(authService)..add(const AuthEvent.checkPinStatus()),
        ),
        BlocProvider(
          create: (_) => VaultBloc(
            secureStorageService,
            supabaseVaultRemote: supabaseVaultRemote,
          ),
        ),
        BlocProvider(create: (_) => PortfolioBloc()),
        BlocProvider(create: (_) => NavCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PassVault',
        theme: _buildTheme(),
        home: const AppSecurityWrapper(child: AuthScreen()),
      ),
    );
  }

  ThemeData _buildTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF5B7FFF),
      brightness: Brightness.dark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.2),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHigh.withValues(alpha: 0.35),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: colorScheme.primary.withValues(alpha: 0.8),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.fixed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: colorScheme.inverseSurface.withValues(alpha: 0.9),
        contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
