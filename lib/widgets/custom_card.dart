import 'package:flutter/material.dart';
import 'package:flutter_themex/themex.dart';

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
      color: tx.backgroundColor,
      child: Padding(
        padding: tx.padding ?? EdgeInsets.all(context.themex.sizes.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: tx.titleStyle,
            ),
            const SizedBox(height: 8.0),
            if (tx is CustomCardThemeExtensionv2)
              Container(
                height: 20,
                color: tx.tintColor,
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

class CustomCardThemeExtension extends ThemeExtension<CustomCardThemeExtension> {
  final TextStyle? titleStyle;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  const CustomCardThemeExtension({
    this.titleStyle,
    this.textStyle,
    this.buttonStyle,
    this.padding,
    this.backgroundColor,
  });

  @override
  CustomCardThemeExtension copyWith({
    TextStyle? titleStyle,
    TextStyle? textStyle,
    ButtonStyle? buttonStyle,
    EdgeInsets? padding,
    Color? backgroundColor,
  }) {
    return CustomCardThemeExtension(
      titleStyle: titleStyle ?? this.titleStyle,
      textStyle: textStyle ?? this.textStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  CustomCardThemeExtension lerp(CustomCardThemeExtension? other, double t) {
    if (other == null) {
      return this;
    }
    return CustomCardThemeExtension(
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t),
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      buttonStyle: ButtonStyle.lerp(buttonStyle, other.buttonStyle, t),
      padding: EdgeInsets.lerp(padding, other.padding, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }

  @override
  String toString() {
    return 'CustomCardThemeExtension(titleStyle: $titleStyle, textStyle: $textStyle, buttonStyle: $buttonStyle, padding: $padding, backgroundColor: $backgroundColor)';
  }
}

class CustomCardThemeExtensionv2 extends CustomCardThemeExtension {
  final Color? tintColor;

  CustomCardThemeExtensionv2({
    super.titleStyle,
    super.textStyle,
    super.buttonStyle,
    super.padding,
    super.backgroundColor,
    required this.tintColor,
  });
}
