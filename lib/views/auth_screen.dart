import 'package:flutter/material.dart';
import 'package:pass_vault/viewmodels/index.dart';
import 'package:pass_vault/views/index.dart';

import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    if (authViewModel.isAuthenticated) {
      return const VaultScreen();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('PassVault')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              authViewModel.failedAttempts >= 5
                  ? 'Too many failed attempts.\nPlease use your device passcode.'
                  : 'Authenticate to unlock your vault.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),

            // Biometric authentication button
            ElevatedButton.icon(
              icon: const Icon(Icons.fingerprint),
              label: const Text('Use Biometric'),
              onPressed:
                  authViewModel.failedAttempts >= 5
                      ? null
                      : () {
                        authViewModel.authenticateWithBiometrics();
                      },
            ),

            const SizedBox(height: 12),

            // PIN authentication button
            ElevatedButton.icon(
              icon: const Icon(Icons.lock),
              label: const Text('Use PIN'),
              onPressed: () async {
                final isPinSet = await authViewModel.isPinSet();
                if (!context.mounted) return;

                if (isPinSet) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return AnimatedPadding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        child: FractionallySizedBox(
                          heightFactor: 0.65,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                            ),
                            child: SafeArea(
                              top: false,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Drag handle
                                    Container(
                                      width: 40,
                                      height: 4,
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),

                                    // PIN input (scroll if needed)
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
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PinSetupScreen()),
                  );
                }
              },
            ),

            if (authViewModel.failedAttempts > 0)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'Failed attempts: ${authViewModel.failedAttempts}',
                  style: TextStyle(color: Colors.red[300]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
