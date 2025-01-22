import 'package:flutter/material.dart';
import 'package:themex/widgets/custom_card.dart';

ThemeData createThemeB(ThemeData theme) {
  return theme.copyWith(
    extensions: [
      ...theme.extensions.values,
      (theme.extension<CustomCardThemeExtension>() ?? const CustomCardThemeExtension()).copyWith(
        backgroundColor: Colors.red,
      ),
    ].whereType<ThemeExtension>(),
  );
}
