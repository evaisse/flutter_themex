import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);
    final themeExtension = Theme.of(context).extension<CustomCardThemeExtension>() ??
        CustomCardThemeExtension(
          titleStyle: theme.textTheme.titleMedium ?? const TextStyle(),
          textStyle: theme.textTheme.bodyMedium ?? const TextStyle(),
          buttonStyle: const ButtonStyle(),
        );

    return Card(
      color: themeExtension.backgroundColor,
      child: Padding(
        padding: themeExtension.padding ?? const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: themeExtension.titleStyle,
            ),
            const SizedBox(height: 8.0),
            if (themeExtension is CustomCardThemeExtensionv2)
              Container(
                height: 20,
                color: themeExtension.tintColor,
              ),
            Text(
              text,
              style: themeExtension.textStyle,
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {},
              style: themeExtension.buttonStyle,
              child: const Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
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
