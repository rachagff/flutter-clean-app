// lib/core/constants/colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryLight = Color(0xFF21BBC7); // Light Teal
  static const Color primaryDark = Color(0xFF1C768C);  // Dark Teal
  static const Color primaryBlue = Color(0xFF21BBC7);  // Alias for primaryLight (to fix existing code)

  // Derived Colors
  static Color lightBlue = primaryLight.withOpacity(0.1);
  static Color lightYellow = const Color(0xFFFFF8E6);
  static Color accentYellow = const Color(0xFFFFC107);
  static Color darkYellow = const Color(0xFFFFA000);
  static Color successGreen = const Color(0xFF4CAF50);
  static Color errorRed = const Color(0xFFF44336);
  static Color textDark = const Color(0xFF333333);
  static Color darkGray = const Color(0xFF666666);

  // Gradients
  static LinearGradient get tealGradient => LinearGradient(
    colors: [primaryLight, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient get tealGradientReversed => LinearGradient(
    colors: [primaryDark, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Original gradients (for backward compatibility)
  static LinearGradient get blueGradient => LinearGradient(
    colors: [primaryLight, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}