# Keeps

Keeps is an offline-first Flutter app for documenting the lifecycle of the things you own.

It stores more than purchase details. Each product has a timeline where you can record maintenance, repairs, upgrades, warranty information, notes, and reflections throughout its life.

## Current implementation status

The app currently includes the core local-first product journal flow:

- Add, edit, and delete products
- Search products from the home screen (in-memory filter by name/brand/category/status)
- Timeline for purchases and events
- Event types including repairs, observations, and custom entries
- Product journal and end-of-life reflection flow
- Warranty tracking with local, battery-friendly reminder notifications
- Photos saved locally and attached to events
- Settings for reminder schedule
- Export to Markdown (per product) and JSON (full library)
- Fully local/offline data storage with SQLite via Drift

## Features

- Add and organize products
- Record events over time
- Track warranties and receive local reminders
- Store photos on events
- Write notes and reflections
- Works completely offline

## Known implementation notes

A few things exist in the schema or dependency list but aren't fully wired into the UI yet. None of these block day-to-day use — noted here so they read as deliberate choices, not surprises:

- **Extended product fields** — `model`, `serialNumber`, `seller`, `purchaseLocation`, `tags`, and `expectedLifetimeMonths` exist in the database schema but have no fields in the Add/Edit Product screen yet.
- **Markdown rendering** — `flutter_markdown` is a dependency, but event and journal notes currently render as plain text rather than formatted Markdown.
- **Per-product JSON export** — the export service supports it, but only per-product Markdown export and full-library JSON export are exposed in the UI.
- **Journal history** — editing the journal replaces the previous note rather than keeping prior revisions. This is an intentional simplification for now (see the technical spec's Known Limitations).

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