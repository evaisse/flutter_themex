import 'package:flutter/material.dart';

class SizesThemeExtension extends ThemeExtension<SizesThemeExtension> {
  /// basic theme extension provides real final unit and NOT nullable
  /// they should be provided using the variant theme if available in
  /// material themeData
  final double medium;

  SizesThemeExtension({required this.medium});

  @override
  ThemeExtension<SizesThemeExtension> copyWith() => this;

  @override
  ThemeExtension<SizesThemeExtension> lerp(covariant ThemeExtension<SizesThemeExtension>? other, double t) => this;
}

extension SizesThemeDataExtension on ThemeData {
  SizesThemeExtension get sizes =>
      extension<SizesThemeExtension>() ??
      SizesThemeExtension(
        medium: 18.0,
      );
}
