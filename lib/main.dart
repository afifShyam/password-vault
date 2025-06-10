import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/index.dart';
import 'viewmodels/index.dart';
import 'views/index.dart';

void main() {
  runApp(const PassVaultApp());
}

class PassVaultApp extends StatelessWidget {
  const PassVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize shared services
    final authService = AuthService();
    final secureStorageService = SecureStorageService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel(authService)),
        ChangeNotifierProvider(create: (_) => VaultViewModel(secureStorageService)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PassVault',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.teal,
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
