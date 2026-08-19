# Keeps — Mobile Application

## Technical & Product Specification (v1)

---

# 1. Executive Summary

**Keeps** is a personal Product Lifecycle Management app for individuals — an offline-first mobile journal that captures the full story of every meaningful purchase: why it was bought, how it was maintained, what broke, what delighted, and whether it was worth owning.

This document defines the architecture, data model, functional scope, and build plan for a **production-grade native mobile application** (iOS + Android), suitable to hand directly to a build session (Claude Code / Flutter toolchain).

---

# 2. Goals & Non-Goals

**Goals**

- Feel like a beautifully crafted personal notebook, not a database or spreadsheet.
- Product creation in under 2 minutes; near-zero maintenance overhead.
- Fully functional with no internet connection, no account, no login.
- Survive 5+ years of use without the data model needing to change.
- Timeline-first interaction model — no tables, no forms-heavy UI.

**Non-Goals**

- Not a warehouse/inventory system, not a bookkeeping app, not multi-user/enterprise software.
- No ads, no engagement/gamification mechanics, no forced cloud account.
- No AI features in MVP (reserved for Phase 3, opt-in only).

---

# 3. Target Platforms

| Platform                       | Priority | Notes                 |
| ------------------------------ | -------- | --------------------- |
| Android (API 26+ / Android 8+) | P0       | Primary design target |

---

# 4. Tech Stack — Decisions & Rationale

Final stack:

| Layer                   | Choice                                                                                             | Why                                                                                                                                                                                                                                                                                                                                                             |
| ----------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Framework**           | **Flutter (Dart), stable channel**                                                                 | Single codebase for iOS/Android/desktop later; Skia/Impeller rendering gives frame-accurate control over the custom timeline, spring physics, and "sticky note" animations the design calls for — harder to achieve cleanly in React Native.                                                                                                                    |
| **State management**    | **Riverpod 2 (code-gen)**                                                                          | Compile-safe, testable, no BuildContext coupling — better long-term maintainability than Bloc's boilerplate for a solo/small-team app of this size.                                                                                                                                                                                                             |
| **Local database**      | **Drift (SQLite)** — _not Isar_                                                                    | The data is inherently relational (Product 1:N Events, 1:N Attachments, 1:N Warranties, 1:N Journal Revisions) and needs real joins for stats (cost rollups, "average time between events"). Drift gives type-safe SQL, reactive streams (perfect for a live-updating timeline), and trivial schema migrations — a better fit than a NoSQL document store here. |
| **Reactive queries**    | Drift's `Stream` queries                                                                           | Timeline and stats auto-update the instant an event is added, no manual refresh logic.                                                                                                                                                                                                                                                                          |
| **Local notifications** | `flutter_local_notifications` + exact alarm scheduling                                             | Powers the 30/7/0-day warranty reminders fully offline.                                                                                                                                                                                                                                                                                                         |
| **File storage**        | Device filesystem via `path_provider`, referenced by path in DB (not BLOBs)                        | Keeps DB small and fast; attachments (photos, PDFs, invoices) live in app sandbox storage.                                                                                                                                                                                                                                                                      |
| **Markdown rendering**  | `flutter_markdown` + custom style sheet matching design tokens                                     | Journal & notes render properly rather than as raw text.                                                                                                                                                                                                                                                                                                        |
| **Animations**          | Flutter's `SpringSimulation` / `implicit animations` + `flutter_animate` for micro-interactions    | Matches the spec's "organic, 250–350ms spring" motion language precisely.                                                                                                                                                                                                                                                                                       |
| **PDF/Export**          | `pdf` + `printing` packages for PDF export; native `json_encode`/Markdown writer for other formats | Fulfils Export requirement (Markdown, PDF, JSON) fully, not just JSON as in the prototype.                                                                                                                                                                                                                                                                      |
| **Backup**              | Manual export/import to a single portable file (SQLite file + attachments zipped)                  | Local-first; no forced cloud dependency.                                                                                                                                                                                                                                                                                                                        |

< br>
| **Optional cloud sync (Phase 3, opt-in)** | Supabase (Postgres + Auth + Storage) | Chosen over Firebase for open-source portability and SQL parity with the local Drift schema, easing conflict resolution logic. |
| **CI/CD** | GitHub Actions + Codemagic | Automated builds, signing, and TestFlight/Play internal testing tracks. |
| **Crash/telemetry** | None by default; **opt-in, anonymized** Sentry only if user enables it in Settings | Preserves the "privacy-first" principle as a hard default, not just a claim. |

**Why not React Native / native Swift+Kotlin:** RN would require Reanimated + Skia-adjacent libraries to hit the same animation fidelity, adding complexity without a clear benefit given team size. Fully native (separate Swift/Kotlin codebases) doubles maintenance for a single-developer-scale product — not justified at this stage.

---

# 5. Data Model

```
Product
 ├── id (uuid, PK)
 ├── name, category, brand, model, serialNumber
 ├── seller, purchaseLocation
 ├── purchasePrice, purchaseDate
 ├── warrantyExpiry
 ├── status (Active | Sold | Disposed | GivenAway | Lost | Stolen)
 ├── expectedLifetimeMonths (nullable)
 ├── tags (comma-separated or join table)
 ├── createdAt, updatedAt
 └── relations → Events (1:N), Attachments (1:N), Warranties (1:N), JournalRevisions (1:N)

Event
 ├── id (uuid, PK), productId (FK)
 ├── date, type (enum, extensible — stored as string, not hard enum, to allow custom types without migration)
 ├── cost (nullable), warrantyExpiry (nullable)
 ├── markdownNote
 ├── createdAt
 └── relations → Attachments (1:N)

JournalRevision   -- preserves Principle 4 (immutable history)
 ├── id, productId (FK)
 ├── content (markdown snapshot)
 ├── createdAt
 └── (editing the journal appends a new revision; the UI always shows history, never silently overwrites)

Attachment
 ├── id, productId or eventId (nullable FK to either)
 ├── type (invoice | manual | photo | warrantyCard | other)
 ├── filePath, thumbnailPath, createdAt

Warranty
 ├── id, productId (FK, nullable), eventId (FK, nullable)
 ├── kind (product | repair | extended | accessory)
 ├── expiryDate
 ├── reminderDaysBefore (default [30,7,0], user-configurable)
```

All monetary/derived fields (ownership duration, total cost, cost/day, repair counts, etc.) are **computed at query time via SQL views**, never stored — per Principle 5 (Derived Data).

---

# 6. Functional Modules (MVP scope)

1. **Product CRUD** — creation flow under 2 minutes; optional fields visually de-emphasized.
2. **Unified Timeline** — single event stream per product; no separate modules per event type.
3. **Event Types** — Observation, Repair, Maintenance, Warranty Claim, Upgrade, Accessory Added, Configuration Change, Cleaning, Damage, Reminder, Reflection, Other, **+ user-defined custom types** (stored as free strings, mapped to a default icon).
4. **Purchase Journal** — immutable, versioned; editing creates a new revision, old versions viewable in a "history" sheet.
5. **Warranty Engine** — tracks product/repair/extended/accessory warranties; local notifications at 30/7/0 days (configurable).
6. **Attachments** — photos, PDFs, invoices, manuals attached to a Product or a specific Event.
7. **Statistics Engine** — ownership duration, current age, total/avg costs, cost-per-day, repair/maintenance counts, average time between events — all computed, never entered.
8. **End-of-Life Flow** — status change + guided reflection (would buy again? surprises? strengths/weaknesses?) → becomes the final timeline event.
9. **Search** — product name, brand, category, status (simple, non-faceted, per spec).
10. **Export** — per-product or full-library export to Markdown, PDF, and JSON.
11. **Backup/Restore** — single-file local backup (DB + attachments), manually triggered.
12. **Settings** — reminder schedule, theme (light/warm default), export/backup, data reset.

---

# 7. UI/UX System

**Design tokens**:
Warm Cream `#F7F4ED`, Soft Beige `#EEE7DA`, Olive `#657153`, Wood Brown `#8B6B4C`, Border `#D8CFBE`, Text `#2F2F2F` / `#6D6A65`. No pure black/white.

**Typography:** Editorial serif for headings (e.g., a humanist serif in the Fraunces/Lora family), clean sans for body text; generous line spacing, rounded corners, soft paper-like shadows.

**Motion:** 250–350ms, spring-based easing on all transitions (card rise, timeline expand, bottom-sheet drag). No linear/mechanical curves.

**Screens:**

- Home (active products list, FAB to add)
- Product Detail (hero + full-height vertical timeline, no tabs)
- Bottom Sheet Summary (Apple-Maps-style draggable control center: stats, Add Event, Files, Edit, Mark Complete, Export, Archive)
- Add/Edit Product
- Add Event
- End-of-Life / Reflection flow
- Notifications (warranty/maintenance reminders)
- Settings

**Navigation:** flat, 3-tab-equivalent (Home / Notifications / Settings) — everything else opens from Home, matching the PRD's "no deep nav tree" requirement.

---

# 8. Performance & Optimization

- **Cold start < 500ms:** deferred provider initialization, lazy-loaded fonts/images, no synchronous DB work on the first frame.
- **Search < 100ms:** indexed columns (name, brand, category, status) in SQLite.
- **Timeline scrolling:** `ListView.builder`/slivers with viewport-based virtualization; images lazy-decoded and cached (`cached_network_image`-style local cache) at thumbnail resolution.
- **Battery/notification efficiency:** batch-scheduled local notifications recalculated only when a warranty date changes, not on every app open.
- **Storage growth:** attachments stored as files (not DB blobs) to keep the SQLite file itself small and fast to back up/restore.

---

# 9. Offline-First & Sync Strategy

- **MVP:** 100% local. No backend, no account, no network calls at all.
- **Phase 3 (opt-in only):** Supabase sync layer. Conflict resolution via event timestamps + a simple version counter per row (last-write-wins with a visible "conflict" banner for the journal, since journal integrity is a stated core value). Sync is additive — the app must remain fully usable if the user never enables it.

---

# 10. Security & Privacy

- No login required in MVP.
- No analytics/telemetry by default; crash reporting is opt-in and anonymized only.
- All data and attachments stay in app-sandboxed local storage unless the user explicitly exports or (Phase 3) enables sync.
- Backup files are unencrypted-by-default local exports; **add optional passphrase encryption for backup files** as a P1 hardening item, since these files may contain invoices/serial numbers.

---

# 11. Testing Strategy

- **Unit tests:** all derived-stats calculations (cost/day, ownership duration, warranty countdown edge cases like leap years/expired warranties).
- **Widget tests:** timeline rendering, event add/edit/delete, journal versioning.
- **Golden tests:** design-token consistency (colors, spacing, typography) across light/dark.
- **Integration tests:** full flow — create product → add events → mark end-of-life → export.

---

# 12. Build, Release & CI/CD

- GitHub Actions: lint + test on every PR.
- Codemagic (or Fastlane): automated signed builds to TestFlight (iOS) and Play Internal Testing (Android).
- Versioning: semantic (MAJOR.MINOR.PATCH), migrations versioned alongside Drift schema to guarantee safe upgrades for users with years of accumulated data.

---

# 13. Roadmap

**Phase 1 — MVP (this spec's core scope):** Sections 6.1–6.12 above, iOS + Android.
**Phase 2:** iPad responsive layout, backup encryption, custom event-type icon picker, PDF export polish.
**Phase 3:** Optional Supabase sync, desktop/web builds, OCR invoice import, AI-generated ownership summaries (opt-in, clearly labeled), brand/category reliability analytics.

---

# 14. Assumptions & Decisions Made Explicit

- Project renamed **Ledger → Keeps** throughout code, bundle IDs, and store listings.
- Flutter chosen over the alternative of React Native or native Swift/Kotlin (Section 4).
- Drift/SQLite chosen over Isar for relational integrity of the stats engine.
- Attachments stored as file references, not DB blobs.
- No login/account in MVP; sync is a deliberately deferred, opt-in Phase 3 feature.
- Telemetry/crash reporting off by default, matching the privacy-first principle from the original PRD.
- Custom event types are supported from MVP via free-text type + default icon fallback, avoiding future DB migrations as required by the PRD.

---

# 15. Success Metrics (carried from original PRD)

- User retention at 5 years.
- Product creation consistently under 2 minutes.
- Warranty reminders prevent at least one forgotten claim per active user per year (self-reported/anecdotal, no telemetry needed to claim this).
- Users report consulting past products before new purchases.
- Timeline naturally grows into a trusted personal ownership history without maintenance fatigue.
