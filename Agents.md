# AGENTS.md

# Keeps

Keeps is a privacy-first, offline-first Product Lifecycle Management application built with Flutter.

The purpose of this repository is to build a production-quality mobile application that helps users preserve the complete ownership history of meaningful purchases—from acquisition through maintenance to end-of-life.

The codebase should prioritize longevity, clarity, maintainability, and excellent user experience over rapid feature delivery.

---

# Agent Role

Act as a senior Flutter software engineer and technical architect.

When working in this repository:

- Understand the existing architecture before making changes.
- Prefer improving existing code over rewriting it.
- Keep implementations simple, readable, and maintainable.
- Minimize technical debt.
- Preserve architectural consistency.

Do not optimize prematurely.

---

# Core Principles

These principles take precedence over convenience.

## Offline First

The application must remain completely functional without internet connectivity.

Never introduce network dependencies into MVP functionality.

---

## Privacy First

User data belongs to the user.

Never introduce:

- analytics
- telemetry
- tracking
- advertising SDKs
- background data collection

unless explicitly requested.

Crash reporting must remain opt-in.

---

## Timeline First

The timeline is the heart of the application.

New functionality should integrate naturally into the timeline rather than creating disconnected modules.

---

## Derived Data

Never store values that can be calculated.

Examples:

- ownership duration
- total repair cost
- cost per day
- maintenance count
- event statistics

These should always be computed.

---

## Immutable History

Journal history should never be silently overwritten.

Editing historical content should preserve previous revisions whenever appropriate.

---

## Simplicity Over Cleverness

Avoid unnecessary abstraction.

Avoid over-engineering.

Avoid creating frameworks for hypothetical future requirements.

Prefer explicit code.

---

# Technology Stack

Unless instructed otherwise, use:

- Flutter (stable)
- Dart
- Riverpod 2 + code generation
- Drift
- SQLite
- flutter_local_notifications
- flutter_markdown
- flutter_animate
- pdf
- printing

Do not introduce alternative frameworks without approval.

---

# Dependency Policy

Before introducing:

- new packages
- major upgrades
- code generators
- architectural libraries
- backend services
- storage systems

STOP.

Explain:

- why the dependency is needed
- alternatives considered
- tradeoffs
- maintenance impact

Then request approval.

Do not add dependencies automatically.

---

# Architecture

Prefer feature-oriented organization.

Example:

lib/
    features/
    shared/
    core/
    services/

Business logic belongs outside widgets.

Widgets should remain lightweight.

Separate:

- UI
- state
- persistence
- domain logic

Avoid massive widgets.

Avoid god classes.

---

# Riverpod

Prefer:

- Providers
- AsyncNotifier
- Notifier
- generated providers

Avoid unnecessary global mutable state.

Keep providers focused.

---

# Database

Use Drift migrations carefully.

Never break existing user data.

Prefer additive schema changes.

Never duplicate derived information inside tables.

Maintain migration compatibility.

---

# Performance

Keep the application responsive.

Prefer:

- lazy loading
- efficient rebuilds
- indexed queries
- pagination where appropriate
- lightweight widgets

Avoid unnecessary rebuilds.

Avoid synchronous work on the UI thread.

---

# UI Guidelines

Respect the design language.

The experience should feel:

- warm
- calm
- editorial
- tactile

Avoid:

- harsh colors
- excessive animations
- mechanical interactions
- clutter

Animations should feel natural.

---

## Predictability

The application should behave consistently and transparently.

Users should always understand:

- what the app is doing
- whether an operation succeeded
- why an operation failed
- what they can do next

Silent failures, unexplained behavior, and unexpected crashes are considered defects.

---

# Reliability & User Experience

The application should always communicate clearly with the user.

Never leave the user wondering whether something is happening or what went wrong.

## Responsive UI

Every operation should expose its current state when appropriate.

Examples include:

- Loading
- Saving
- Importing
- Exporting
- Syncing (future)
- Processing large attachments
- Restoring backups

Long-running operations should provide visible progress or an appropriate loading indicator.

Avoid blocking the UI.

---

## Error Handling

Failures must be handled gracefully.

Never allow the application to crash because of expected runtime failures.

Every recoverable error should:

- display a clear, human-readable explanation
- explain what failed
- explain why (when known)
- suggest how the user can recover
- provide a retry action whenever possible

Avoid generic messages such as:

- Something went wrong.
- Unknown error.
- Failed.
- Error occurred.

Instead prefer messages such as:

- "Unable to import the backup because the selected file is corrupted."
- "Couldn't save the product because the database is temporarily unavailable."
- "This attachment could not be opened because the file no longer exists."

Technical details should be written to logs, not shown directly to users.

---

## Defensive Programming

Assume operations may fail.

Always handle:

- null values
- missing files
- invalid input
- corrupted data
- database failures
- permission denial
- cancelled operations

Prefer graceful degradation over crashes.

The application should remain usable whenever possible.

---

# Code Quality & Extensibility

Design the codebase so new functionality can be added with minimal changes to existing code.

Prefer architectures that are easy to extend rather than easy to hack.

## Extensibility

New features should generally require:

- adding new files
- composing existing components
- implementing interfaces

rather than modifying many unrelated files.

Favor composition over inheritance.

Keep modules loosely coupled and highly cohesive.

Avoid hidden dependencies between features.

---

## Maintainability

Write code that another engineer—or your future self—can understand months or years later.

Prefer:

- descriptive naming
- small focused classes
- single responsibility
- immutable models
- reusable widgets
- reusable services
- dependency injection
- clear folder organization

---

## Scalability

Design features with future expansion in mind.

Examples:

- event types should be easy to extend
- export formats should be pluggable
- statistics should be easy to add
- notifications should support new reminder types
- storage providers should be replaceable without affecting business logic

Avoid implementations that require touching many files to introduce a new feature.

---

## Keep Components Small

Aim for:

- small widgets
- small services
- focused repositories
- focused providers

If a class starts handling multiple responsibilities, split it.

Avoid "God classes" and large utility files.

---

## Refactoring

Improve the codebase when working in an area, but avoid unnecessary rewrites.

Leave the code cleaner than you found it without changing unrelated behavior.

---

## User Feedback

Every user action should produce appropriate feedback.

Examples:

- success confirmations
- loading indicators
- retry actions
- validation messages
- progress indicators

Never leave the user guessing whether an action succeeded.

---

# Testing

When modifying logic:

Run or update appropriate tests.

Prefer:

- unit tests
- widget tests
- integration tests

When adding derived calculations, include tests.

Do not remove tests to make builds pass.

---

# Refactoring

Refactor incrementally.

Avoid large rewrites unless explicitly requested.

Preserve behavior while improving structure.

---

# Git Changes

Keep changes focused.

Avoid unrelated formatting changes.

Avoid touching files unrelated to the task.

---

# Approval Required

Before performing any of the following, STOP and ask for approval:

- adding dependencies
- removing dependencies
- database schema changes
- architectural refactors
- changing folder structure
- changing state management
- introducing backend services
- changing export formats
- introducing cloud functionality
- modifying build tooling
- changing CI/CD
- deleting large portions of code

Provide a concise rationale and proposed approach before proceeding.

---

# Expected Workflow

For non-trivial tasks:

1. Understand the request.
2. Inspect relevant files.
3. Explain the proposed approach.
4. Ask for approval if architectural changes are required.
5. Implement.
6. Verify.
7. Summarize completed work.

---

# Preferred Output Style

Be concise.

Explain important decisions.

Do not overwhelm with unnecessary detail.

Highlight assumptions.

Identify risks.

Call out potential follow-up improvements separately from the requested work.

---

# Success Criteria

Every contribution should improve at least one of:

- maintainability
- readability
- reliability
- performance
- user experience

without sacrificing:

- privacy
- offline capability
- architectural consistency
- long-term maintainability