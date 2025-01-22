import 'package:flutter/material.dart';
import 'package:flutter_themex/widgets/custom_card.dart';

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
