# 🔐 PassVault — Secure Password Manager App

**PassVault** is a lightweight, secure, and user-friendly password manager built with **Flutter**. It allows you to safely store, manage, and retrieve your passwords and associated login information — all in one place.

---

## ✨ Features

- ✅ Securely store passwords using encrypted local storage
- ✅ Add, update, and delete password entries
- ✅ Email field support for login reference
- ✅ Search entries in real-time
- ✅ Toggle password visibility securely
- ✅ Automatically deduplicates stored emails
- ✅ State management using `Provider` + `ChangeNotifier`
- ✅ Clean architecture with `freezed` for immutable states

---

## ⚙️ Tech Stack

- **Flutter** (UI)
- **Provider** (state management)
- **Freezed** (immutable state modeling)
- **UUID** (unique ID generation)
- **SecureStorageService** (secure local storage abstraction)

---

## 📦 Architecture Overview

- `VaultState`: Holds a unified app state (status, entries, search query, etc.)
- `VaultViewModel`: Manages business logic (load, save, update, delete)
- `SecureStorageService`: Handles encrypted storage operations
- Clean separation between UI, logic, and storage for testability and scalability

---

## 🚀 Getting Started

To run the app locally:

```bash
flutter pub get
flutter run
