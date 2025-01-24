import 'package:flutter/material.dart';
import 'package:themex/macros/theme_macro.dart';
import 'package:themex/themex.dart';
import 'package:themex/widgets/theme_switcher.dart';

enum TitleBoxStyles { primary, secondary }

class TitleBox extends StatelessWidget {
  final ThemeChoice choice;
  final TitleBoxStyles style;

  const TitleBox.primary({
    super.key,
    required this.choice,
  }) : style = TitleBoxStyles.primary;

  const TitleBox.secondary({
    super.key,
    required this.choice,
  }) : style = TitleBoxStyles.secondary;

  @override
  Widget build(BuildContext context) {
    final tx = switch (style) {
          (TitleBoxStyles.primary) => context.themex.titleBox.primary,
          (TitleBoxStyles.secondary) => context.themex.titleBox.secondary,
        } ??
        TitleBoxStyle();

    return Container(
      padding: tx.padding ?? EdgeInsets.all(context.themex.sizes.spacingMedium),
      child: Text(
        choice.name,
        style: tx.textStyle,
      ),
    );
  }
}

extension TitleBoxThemeDataExtension on ThemeData {
  ///
  TitleBoxThemeExtension get titleBox => extension<TitleBoxThemeExtension>() ?? const TitleBoxThemeExtension();
}

final class TitleBoxStyle {
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  TitleBoxStyle({
    this.textStyle,
    this.padding,
  });

  static TitleBoxStyle? lerp(TitleBoxStyle? a, TitleBoxStyle? b, double t) {
    return TitleBoxStyle(
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
      padding: EdgeInsets.lerp(a?.padding, b?.padding, t),
    );
  }
}

@ThemeMacro()
class TitleBoxThemeExtension extends ThemeExtension<TitleBoxThemeExtension> {
  final TitleBoxStyle? primary;
  final TitleBoxStyle? secondary;
}
