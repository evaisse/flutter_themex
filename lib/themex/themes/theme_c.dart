import 'package:flutter/material.dart';
import 'package:themex/themex.dart';
import 'package:themex/widgets/custom_card.dart';

final themeC = Themex(
  /// Specify some basic tokens
  themeBuilder: (theme) => theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      primary: Colors.amber,
    ),
  ),
  extensionBuilders: {
    /// bost some sizes
    (theme) => theme.sizes.copyWith(spacingLarge: 23),

    /// extends customcards with different behavior than the basic
    /// [CustomCardThemeExtension] extensions provide
    (theme) => CustomCardThemeExtensionv2(
          backgroundColor: theme.colorScheme.primary,
          separatorColor: Colors.yellow,
        ),
  },
);
