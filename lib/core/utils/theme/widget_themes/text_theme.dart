import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_bot/core/utils/constant/colour.dart';
import 'package:health_bot/core/utils/constant/sizes.dart';

/// Custom Class for Light & Dark Text Themes
class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge:
        const TextStyle().copyWith(fontSize: 30.0, color: TColors.dark),
    headlineMedium:
        const TextStyle().copyWith(fontSize: 22.0, color: TColors.dark),
    // headlineSmall:
    //     TextStyle().copyWith(fontSize: 20.0, color: TColors.dark),
    titleLarge:
        const TextStyle().copyWith(fontSize: 20.0, color: TColors.dark),
    titleMedium:
        const TextStyle().copyWith(fontSize: 16.0, color: TColors.dark),
    // titleSmall: TextStyle().copyWith(fontSize: 16.0, color: TColors.dark),
    // bodyLarge: TextStyle().copyWith(fontSize: 14.0, color: TColors.dark),
    // bodyMedium: TextStyle().copyWith(fontSize: 14.0, color: TColors.dark),
    // bodySmall: TextStyle()
    //     .copyWith(fontSize: 13.0, color: TColors.dark.withOpacity(0.5)),
    labelLarge:
        const TextStyle().copyWith(fontSize: 14.0, color: TColors.dark),
    labelMedium: const TextStyle()
        .copyWith(fontSize: 12.0, color: TColors.dark.withOpacity(0.5)),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge:
        const TextStyle().copyWith(fontSize: 30.0, color: TColors.light),
    headlineMedium:
        const TextStyle().copyWith(fontSize: 24.0, color: TColors.light),
    headlineSmall:
        const TextStyle().copyWith(fontSize: 18.0, color: TColors.light),
    titleLarge:
        const TextStyle().copyWith(fontSize: 16.0, color: TColors.light),
    titleMedium:
        const TextStyle().copyWith(fontSize: 16.0, color: TColors.light),
    titleSmall:
        const TextStyle().copyWith(fontSize: 16.0, color: TColors.light),
    bodyLarge:
        const TextStyle().copyWith(fontSize: 14.0, color: TColors.light),
    bodyMedium:
        const TextStyle().copyWith(fontSize: 14.0, color: TColors.light),
    bodySmall: const TextStyle()
        .copyWith(fontSize: 13.0, color: TColors.light.withOpacity(0.5)),
    labelLarge:
        const TextStyle().copyWith(fontSize: 12.0, color: TColors.light),
    labelMedium: const TextStyle()
        .copyWith(fontSize: 12.0, color: TColors.light.withOpacity(0.5)),
  );
}
