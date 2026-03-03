# PassVault

PassVault is a Flutter password manager with local secure storage, biometric/PIN unlock, and optional encrypted cloud sync through Supabase.

## Features

- Local-first vault storage using `flutter_secure_storage` (Android encrypted shared prefs + iOS keychain).
- Unlock with biometrics or a 6-digit app PIN.
- Session auto-lock after 1 minute of inactivity.
- Privacy blur overlay when the app goes to background.
- Vault CRUD: add, edit, delete, search, preview, copy password.
- Password visibility control per entry and global hide-on-lifecycle events.
- Optional cloud sync with Supabase (`vault_entries`) where payloads are encrypted with AES-256-GCM before upload.
- Built-in portfolio tab rendered with `webview_flutter`.

## Stack

- Flutter + Material 3
- `flutter_bloc` + `freezed`
- `flutter_secure_storage`
- `local_auth`
- `cryptography` (AES-GCM)
- `supabase_flutter`
- `webview_flutter`

## App Architecture

State management is BLoC-based:

- `AuthBloc`: biometric/PIN auth, PIN setup/reset, session state.
- `VaultBloc`: local vault storage, filtering, visibility toggling, remote merge/sync.
- `PortfolioBloc`: webview lifecycle, loading/error/progress, navigation state.
- `NavCubit`: tab and floating navbar state.

Core services:

- `SecureStorageService`: passwords, PIN, saved emails, encryption key.
- `EncryptionService`: AES-256-GCM encrypt/decrypt for remote payloads.
- `SupabaseVaultRemote`: encrypted read/write/delete for `vault_entries`.
- `SupabaseKeyRemote`: reads/saves encoded key in `vault_keys`.

## Supabase (Optional)

Supabase initialization is optional at runtime. If config is missing, the app still runs in local-only mode.

Set runtime values with `--dart-define`:

```bash
flutter run \
  --dart-define=SUPABASE_URL=https://your-project.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=your-anon-key
```

Expected remote tables:

- `vault_entries`: stores encrypted `payload`, plus `entry_key`, `title`, `email`, `updated_at`, and optional `user_id`.
- `vault_keys`: stores `id`, `encoded_key`, `updated_at`.

## Getting Started

```bash
flutter pub get
flutter run
```

When editing Freezed/JSON models or events/states:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Android Release Hardening

`android/app/build.gradle.kts` already enables:

- R8 code shrinking (`isMinifyEnabled = true`)
- Resource shrinking (`isShrinkResources = true`)
- ProGuard rules (`proguard-rules.pro`)

You can additionally obfuscate Dart symbols:

```bash
flutter build appbundle --release --obfuscate --split-debug-info=build/debug-info
```

## Quality Checks

```bash
dart format .
dart analyze
flutter test
```

## Notes

- The default widget test (`test/widget_test.dart`) is still Flutter template-style and does not reflect current app behavior.
- Replace any default Supabase credentials in your own deployments.
