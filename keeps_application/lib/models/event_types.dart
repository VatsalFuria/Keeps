/// Event type is stored as free text (not a hard enum) per spec Section 5,
/// so custom types survive without a schema migration. This map supplies
/// default icons; unknown/custom types fall back to a bullet.
const Map<String, String> kEventIcons = {
  'Observation': '👁',
  'Repair': '🔧',
  'Maintenance': '🧴',
  'Warranty Claim': '📄',
  'Upgrade': '⬆',
  'Accessory Added': '➕',
  'Configuration Change': '⚙',
  'Cleaning': '✨',
  'Damage': '⚠',
  'Reminder': '⏰',
  'Reflection': '💭',
  'Other': '•',
};

String iconFor(String type) => kEventIcons[type] ?? '•';

/// 'GivenAway' -> 'Given Away' for display, per spec's status enum naming.
String prettyStatus(String s) =>
    s.replaceAllMapped(RegExp('([A-Z])'), (m) => ' ${m[1]}').trim();