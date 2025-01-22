import 'package:flutter/material.dart';

export 'themex/size_theme_extension.dart';

/// Sample extensions to simplify access to theme extensions
///
extension ThemeDataBuildContextExtension on BuildContext {
  ThemeData get themex => Theme.of(this);
}
