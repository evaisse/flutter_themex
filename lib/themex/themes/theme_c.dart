import 'package:flutter/material.dart';
import 'package:themex/themex/size_theme_extension.dart';
import 'package:themex/widgets/custom_card.dart';

ThemeData createThemeC(ThemeData theme) {
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      primary: Colors.amber,
    ),
    extensions: [
      ...theme.extensions.values,
      theme.sizes.copyWith(spacingLarge: 23),
      CustomCardThemeExtensionv2(
        backgroundColor: Colors.red,
        separatorColor: Colors.yellow,
      ),
    ],
  );
}
