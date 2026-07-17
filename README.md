# Keeps

Keeps is an offline-first Flutter app for documenting the lifecycle of the things you own.

It stores more than purchase details. Each product has a timeline where you can record maintenance, repairs, upgrades, warranty information, notes, and reflections throughout its life.

## Features

- Add and organize products
- Record events over time
- Track warranties and receive reminders
- Store photos, invoices, and manuals
- Write notes and reflections
- Works completely offline

## Tech Stack

- Flutter
- Riverpod
- Drift (SQLite)
- flutter_local_notifications

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio or VS Code
- Android emulator or physical device

### Installation

```bash
git clone <repository-url>
cd keeps
flutter pub get
flutter run
```

## Project Structure

```
lib/
├── core/
├── data/
├── features/
├── services/
├── shared/
└── main.dart
```

## Status

This is a personal project under active development. The app is currently local-first with no account or cloud sync.
