# 🔐 PassVault — Secure Password Manager App

PassVault is a private-by-design password vault that keeps your logins encrypted on-device, lets you back them up safely to the cloud, and restores them when you reinstall—without exposing your secrets. Built with Flutter for a fast, native feel.

---

## ✨ Highlights

- 🔒 End-to-end mindset: secure storage + app-level encryption for cloud backups
- 👆 Biometrics / PIN with idle auto-lock that closes lingering dialogs
- 🔍 Live search with responsive two-column vault cards and quick actions
- 🧭 Easy recoverability: encrypted export/import so you can reinstall without losing data
- ♻️ Email suggestions & dedupe when adding new entries
- 🧱 Modular widgets (`VaultEntryCard`, `VaultSearchBar`, `VaultEmptyState`) for clean architecture
- 📦 Provider-based state management and immutable state via `freezed`

---

## ⚙️ Tech Stack

- **Flutter** – UI framework
- **Provider** + `ChangeNotifier` – state management
- **Freezed / json_serializable** – immutable state & model generation
- **UUID** – unique entry IDs
- **flutter_secure_storage** – encrypted secrets
- **cryptography** – AES-GCM encryption for backup/restore payloads
- **webview_flutter** – portfolio tab

---

## 🏗️ Architecture Overview

- `VaultState` – immutable snapshot of vault data, search query, and status
- `VaultViewModel` – orchestrates storage reads/writes, filtering, visibility toggles
- `PortfolioViewModel` – manages WebView lifecycle & error state
- `SecureStorageService` – platform-aware secure storage abstraction
- Presentation layer composes reusable widgets, keeping views slim and testable

---

## 🚀 Getting Started

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

---

## 🔒 Hardening / Obfuscation

- Android release builds use R8/ProGuard shrinking + obfuscation (`android/app/build.gradle.kts`).
- Build obfuscated Dart code with split debug info to keep stack traces readable:

```bash
flutter build appbundle --release --obfuscate --split-debug-info=build/debug-info
```

Store the `build/debug-info` directory securely so you can de-obfuscate crash reports.

---

## 🧪 Recommended Commands

- `flutter analyze`
- `flutter test`

---

## 📄 License

MIT © Shyam
