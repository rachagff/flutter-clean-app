// lib/admin_access.dart
class AdminAccess {
  // Secret code in search bar
  static const List<String> adminCodes = [
    'admin123',
    'cleaningpro',
    '8888',
    'openadmin',
  ];

  // Check if search query is an admin code
  static bool isAdminCode(String query) {
    return adminCodes.contains(query.toLowerCase());
  }

  // Tap pattern on logo
  static bool checkTapPattern(List<DateTime> taps) {
    if (taps.length < 3) return false;

    final duration1 = taps[1].difference(taps[0]);
    final duration2 = taps[2].difference(taps[1]);

    // Check for triple tap within 2 seconds
    return duration1.inMilliseconds < 1000 &&
        duration2.inMilliseconds < 1000;
  }

  // Easter egg codes
  static const Map<String, String> easterEggs = {
    'devmode': 'Mode développeur activé',
    'showadmin': 'Afficher les options admin',
    'resetapp': 'Réinitialiser l\'application',
    'debuginfo': 'Afficher les infos de débogage',
  };

  // Check for easter egg
  static String? checkEasterEgg(String input) {
    return easterEggs[input.toLowerCase()];
  }
}