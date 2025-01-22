import 'package:flutter/material.dart';
import 'package:themex/widgets/custom_card.dart';

ThemeData createThemeC(ThemeData theme) {
  return theme.copyWith(
    extensions: [
      CustomCardThemeExtensionv2(
        tintColor: Colors.yellow,
      ),
      ...theme.extensions.values,
    ].whereType<ThemeExtension>(),
  );
}
