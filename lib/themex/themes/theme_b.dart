import 'package:flutter/material.dart';
import 'package:themex/themex.dart';
import 'package:themex/widgets/custom_card.dart';
import 'package:themex/widgets/title_box.dart';

final themeB = Themex(
  /// copy and override default material system
  themeBuilder: (theme) => theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      primary: Colors.red,
    ),
  ),
  extensionBuilders: {
    /// Setup your custom design tokens
    ///
    ///
    (theme) => theme.customCard.copyWith(
          backgroundColor: theme.colorScheme.primary,
        ),

    /// Setup your custom design tokens
    ///
    ///
    (theme) => theme.titleBox.copyWith(
          primary: TitleBoxStyle(
            /// reuse of theme tokens for spacing
            padding: EdgeInsets.all(theme.sizes.spacingXSmall),
          ),
        ),
  },
);
