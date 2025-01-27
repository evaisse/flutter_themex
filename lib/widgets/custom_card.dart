import 'package:flutter/material.dart';
import 'package:themex/macros/theme_macro.dart';
import 'package:themex/themex.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String text;

  const CustomCard({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final tx = context.themex.customCard;

    return Card(
      // surfaceTintColor:
      // (Theme.of(context).extension<CustomCardThemeExtension>() ?? const CustomCardThemeExtension()).backgroundColor,
      surfaceTintColor: context.themex.customCard.backgroundColor,
      child: Padding(
        padding: tx.padding ?? EdgeInsets.all(context.themex.sizes.spacingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: tx.titleStyle),
            const SizedBox(height: 8.0),
            if (tx is CustomCardThemeExtensionv2)
              Container(
                // height: tx.spacingLarge,
                height: tx.separatorHeight ?? context.themex.sizes.spacingLarge,
                color: tx.separatorColor ?? context.themex.colorScheme.primary,
              ),
            Text(
              text,
              style: tx.textStyle,
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {},
              style: tx.buttonStyle,
              child: const Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}

extension CustomCardThemeDataExtension on ThemeData {
  CustomCardThemeExtension get customCard => extension<CustomCardThemeExtension>() ?? const CustomCardThemeExtension();
}

@ThemeMacro(imports: "package:flutter/material.dart")
class CustomCardThemeExtension extends ThemeExtension<CustomCardThemeExtension> {
  final TextStyle? titleStyle;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  String toString() {
    return 'CustomCardThemeExtension(titleStyle: $titleStyle, textStyle: $textStyle, buttonStyle: $buttonStyle, padding: $padding, backgroundColor: $backgroundColor)';
  }
}

class CustomCardThemeExtensionv2 extends CustomCardThemeExtension {
  final Color? separatorColor;
  final double? separatorHeight;

  ///super.titleStyle etc ne fonctionne pas, la classe dérivée doit appeler explicitement le constructeur parent à cause de la macro
  CustomCardThemeExtensionv2({
    this.separatorColor,
    this.separatorHeight,
    TextStyle? titleStyle,
    TextStyle? textStyle,
    ButtonStyle? buttonStyle,
    EdgeInsets? padding,
    Color? backgroundColor,
  }) : super(
          titleStyle: titleStyle,
          textStyle: textStyle,
          buttonStyle: buttonStyle,
          padding: padding,
          backgroundColor: backgroundColor,
        );
}
