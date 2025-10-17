import 'package:flutter/material.dart';
import 'package:pass_vault/utils/index.dart';
import 'package:pass_vault/viewmodels/index.dart';
import 'package:pass_vault/views/index.dart';

import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    if (authViewModel.isAuthenticated) {
      return IdleWatcher(
        onTimeout: () {
          authViewModel.reset();
        },
        child: const VaultScreen(),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colors.primaryContainer.withValues(alpha: 0.2),
              colors.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.surface.withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: colors.outlineVariant.withValues(alpha: 0.3),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colors.shadow.withValues(alpha: 0.12),
                        blurRadius: 32,
                        offset: const Offset(0, 14),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 36, 32, 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                colors.primary.withValues(alpha: 0.85),
                                colors.secondary.withValues(alpha: 0.75),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(Icons.vpn_key_outlined, size: 48),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Welcome to PassVault',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          authViewModel.failedAttempts >= 5
                              ? 'Too many failed attempts. Use your device security to continue.'
                              : 'Authenticate to unlock your encrypted vault.',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 32),
                        FilledButton.icon(
                          icon: const Icon(Icons.fingerprint, size: 26),
                          style: FilledButton.styleFrom(
                            minimumSize: const Size.fromHeight(56),
                            textStyle: textTheme.titleMedium,
                          ),
                          onPressed:
                              authViewModel.failedAttempts >= 5
                                  ? null
                                  : authViewModel.authenticateWithBiometrics,
                          label: const Text('Unlock with biometrics'),
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton.icon(
                          icon: const Icon(Icons.lock_outline, size: 24),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(56),
                            textStyle: textTheme.titleMedium,
                          ),
                          onPressed: () async {
                            final isPinSet = await authViewModel.isPinSet();
                            if (!context.mounted) return;

                            if (isPinSet) {
                              _showPinEntrySheet(context);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PinSetupScreen(),
                                ),
                              );
                            }
                          },
                          label: const Text('Enter PIN instead'),
                        ),
                        const SizedBox(height: 20),
                        AnimatedOpacity(
                          opacity: authViewModel.failedAttempts > 0 ? 1 : 0,
                          duration: const Duration(milliseconds: 200),
                          child:
                              authViewModel.failedAttempts > 0
                                  ? Column(
                                    children: [
                                      Text(
                                        'Failed attempts: ${authViewModel.failedAttempts}',
                                        style: textTheme.bodyMedium?.copyWith(
                                          color: colors.error,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Five failed attempts will disable biometric unlock temporarily.',
                                        textAlign: TextAlign.center,
                                        style: textTheme.bodySmall?.copyWith(
                                          color: colors.onSurfaceVariant
                                              .withValues(alpha: 0.8),
                                        ),
                                      ),
                                    ],
                                  )
                                  : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showPinEntrySheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final colors = Theme.of(context).colorScheme;
        return AnimatedPadding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          child: FractionallySizedBox(
            heightFactor: 0.65,
            child: Container(
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.shadow.withValues(alpha: 0.2),
                    blurRadius: 32,
                    offset: const Offset(0, -12),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 48,
                        height: 5,
                        decoration: BoxDecoration(
                          color: colors.onSurfaceVariant.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Enter your security PIN',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      const Expanded(child: CustomPinEntryScreen()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
