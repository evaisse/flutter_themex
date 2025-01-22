import 'package:flutter/material.dart';
import 'package:themex/themex.dart';
import 'package:themex/widgets/theme_switcher.dart';

class TitleBox extends StatelessWidget {
  final ThemeChoice choice;

  const TitleBox({
    super.key,
    required this.choice,
  });

  @override
  Widget build(BuildContext context) {
    final tx = context.themex.titleBox;

    return Container(
      padding: tx.padding ?? EdgeInsets.all(context.themex.sizes.medium),
      child: Text(
        choice.name,
        style: tx.textStyle,
      ),
    );
  }
}

extension on ThemeData {
  ///
  TitleBoxThemeExtension get titleBox => extension<TitleBoxThemeExtension>() ?? TitleBoxThemeExtension();
}

class TitleBoxThemeExtension extends ThemeExtension<TitleBoxThemeExtension> {
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  TitleBoxThemeExtension({
    this.textStyle,
    this.padding,
  });

  @override
  ThemeExtension<TitleBoxThemeExtension> copyWith() => TitleBoxThemeExtension();

  @override
  ThemeExtension<TitleBoxThemeExtension> lerp(covariant ThemeExtension<TitleBoxThemeExtension>? other, double t) =>
      copyWith();
}
