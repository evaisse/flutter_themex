import 'package:flutter/material.dart';

export 'themex/size_theme_extension.dart';

/// Sample extensions to simplify access to theme extensions
///
extension ThemeDataBuildContextExtension on BuildContext {
  ThemeData get themex => Theme.of(this);
}

class Themex {
  final ThemeData Function(ThemeData from) themeBuilder;
  final Set<ThemeExtension? Function(ThemeData theme)> extensionBuilders;

  Themex({required this.themeBuilder, required this.extensionBuilders});

  ThemeData build(ThemeData from) {
    var theme = themeBuilder(from);
    for (final cust in extensionBuilders) {
      final ext = cust(theme);
      if (ext == null) continue;
      theme = theme.copyWith(extensions: [...theme.extensions.values, ext]);
    }
    return theme;
  }
}

ThemeData buildCustomTheme({
  required ThemeData themeBuilder,
  required Set<ThemeExtension? Function(ThemeData theme)> extensionBuilders,
}) {
  var theme = themeBuilder;
  for (final cust in extensionBuilders) {
    final ext = cust(theme);
    if (ext == null) continue;
    theme = theme.copyWith(extensions: [...theme.extensions.values, ext]);
  }
  return theme;
}
