import 'package:flutter/material.dart';

/// basic theme extension provides real final unit and NOT nullable
/// they should be provided using the variant theme if available in
/// material themeData
class SizesThemeExtension extends ThemeExtension<SizesThemeExtension> {
  /// Spacing for very light margins, inline spans and text details
  final double spacingXSmall;

  /// spacing units for light text and small buttons
  final double spacingSmall;

  /// Spacing unit for standard padding / margins / separator
  final double spacingMedium;

  /// Spacing unit for larger elements, e.g. titles
  final double spacingLarge;

  /// Spacing unit for extra-large, pretty
  final double spacingXLarge;

  SizesThemeExtension({
    this.spacingXSmall = 2,
    this.spacingSmall = 4,
    this.spacingMedium = 8,
    this.spacingLarge = 16,
    this.spacingXLarge = 20,
  });

  @override
  SizesThemeExtension copyWith({
    double? spacingXSmall,
    double? spacingSmall,
    double? spacingMedium,
    double? spacingLarge,
    double? spacingXLarge,
  }) {
    return SizesThemeExtension(
      spacingXSmall: spacingXSmall ?? this.spacingXSmall,
      spacingSmall: spacingSmall ?? this.spacingSmall,
      spacingMedium: spacingMedium ?? this.spacingMedium,
      spacingLarge: spacingLarge ?? this.spacingLarge,
      spacingXLarge: spacingXLarge ?? this.spacingXLarge,
    );
  }

  @override
  SizesThemeExtension lerp(covariant ThemeExtension<SizesThemeExtension>? other, double t) => this;
}

extension SizesThemeDataExtension on ThemeData {
  SizesThemeExtension get sizes => extension<SizesThemeExtension>() ?? SizesThemeExtension();
}
