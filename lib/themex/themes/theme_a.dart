import 'package:flutter/material.dart';
import 'package:themex/widgets/custom_card.dart';

ThemeData createThemeA(ThemeData theme) {
  final customCardThemeExtension = theme.extension<CustomCardThemeExtension>() ?? const CustomCardThemeExtension();

  return theme.copyWith(extensions: [
    customCardThemeExtension.copyWith(
      backgroundColor: Colors.indigo,
    ),

    /// important or you will loose previous theme extensions
    ...theme.extensions.values,
  ]);
}
