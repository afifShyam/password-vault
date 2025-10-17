# 🔐 PassVault — Secure Password Manager App

PassVault is a lightweight, secure password manager built with **Flutter**. It keeps your credentials safe in an encrypted vault and wraps them in a streamlined Material 3 experience.

---

## ✨ Highlights

- 🔒 Encrypted storage backed by `flutter_secure_storage`
- 👆 Biometrics / PIN authentication with idle auto-lock that also closes lingering dialogs
- 🗂️ Minimal two-column vault with responsive cards and quick actions
- 🌐 Portfolio tab powered by an embedded WebView (`webview_flutter`)
- 🔍 Live search with Provider-backed filtering
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

## 🧪 Recommended Commands

- `flutter analyze`
- `flutter test`

---

## 📄 License

MIT © Shyam
