# Keeps

Keeps is an offline-first Flutter app for documenting the lifecycle of the things you own.

It stores more than purchase details. Each product has a timeline where you can record maintenance, repairs, upgrades, warranty information, notes, and reflections throughout its life.

## Current implementation status

The app currently includes the core local-first product journal flow:

- Add, edit, and delete products
- Search products from the home screen
- Timeline for purchases and events
- Event types including repairs, observations, and custom entries
- Product journal and end-of-life flow
- Warranty tracking with local reminder notifications
- Photos and attachments saved locally
- Settings for reminder schedule
- Export to JSON and Markdown
- Fully local/offline data storage with SQLite via Drift

## Features

- Add and organize products
- Record events over time
- Track warranties and receive local reminders
- Store photos, invoices, and manuals
- Write notes and reflections
- Works completely offline

## Tech Stack

- Flutter
- Riverpod
- Drift (SQLite)
- flutter_local_notifications
- flutter_markdown
- path_provider
- share_plus
- intl
- uuid

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio or VS Code
- Android emulator or physical device

### Installation

```bash
cd keeps_application
flutter pub get
flutter run
```

## Project Structure

```text
lib/
├── data/
├── models/
├── providers/
├── screens/
├── services/
├── theme/
├── widgets/
├── main.dart
└──
```

## Status

This project is under active development and already includes the core mobile journal workflow. The implementation is local-first and does not include cloud sync or account-based features.

## [PLANNED NOT IMPLEMENTED]

These items are still planned and are not yet implemented in the current app:

- PDF export
- Backup restore/import flow
- iOS app support / release pipeline
- Android app icon generation and app-store assets
- Cloud sync or multi-device sync
- Backup encryption
- CI/CD automation and release signing
- Optional AI features
- Theme customization beyond the current built-in design system
- Desktop/web build targets

These items are still part of the roadmap and should be treated as future work rather than current functionality.
