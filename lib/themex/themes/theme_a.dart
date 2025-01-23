import 'package:flutter/material.dart';
import 'package:themex/themex.dart';
import 'package:themex/widgets/custom_card.dart';

final themeA = Themex(
  themeBuilder: (theme) => theme.copyWith(),
  extensionBuilders: {
    /// custom cards
    (theme) => theme.customCard.copyWith(
          backgroundColor: Colors.indigo,
        ),
  },
);

// class ThemeA extends Themex {

//   @override
//   final themeBuilder = (theme) => theme.copyWith();

//   @override
//   final extensionBuilders = {
//     (theme) => theme.customCard.copyWith(backgroundColor: Colors.indigo),
//   };
// }

// ThemeData createThemeA(ThemeData theme) => buildCustomTheme(
//       themeBuilder: theme.copyWith(),
//       extensionBuilders: {
//         (theme) => theme.customCard.copyWith(backgroundColor: Colors.indigo),
//       },
//     );
