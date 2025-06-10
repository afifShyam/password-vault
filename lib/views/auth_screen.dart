import 'package:flutter/material.dart';
import 'package:pass_vault/viewmodels/index.dart';
import 'package:pass_vault/views/vault_screen.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    if (authViewModel.isAuthenticated) {
      // Navigate to the vault screen
      return const VaultScreen();
    }

    return Scaffold(
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
            IconButton(
              icon: Icon(Icons.fingerprint),
              onPressed: () {
                authViewModel.authenticate();
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
