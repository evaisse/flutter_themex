import 'package:flutter/material.dart';

import 'widgets/custom_card.dart';
import 'widgets/theme_switcher_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultChoice = (
      name: "A",
      theme: Theme.of(context).copyWith(extensions: [
        const CustomCardThemeExtension(
          backgroundColor: Colors.indigo,
        )
      ]),
    );
    final themeNotifier = ValueNotifier(defaultChoice);
    final themes = {
      defaultChoice,
      (
        name: "B",
        theme: defaultChoice.theme.copyWith(
          extensions: [
            ...defaultChoice.theme.extensions.values,
            defaultChoice.theme.extension<CustomCardThemeExtension>()?.copyWith(
                  backgroundColor: Colors.red,
                ),
          ].whereType<ThemeExtension>(),
        )
      ),
      (
        name: 'C',
        theme: defaultChoice.theme.copyWith(
          extensions: [
            ...defaultChoice.theme.extensions.values,
            CustomCardThemeExtensionv2(
              tintColor: Colors.yellow,
            ),
          ].whereType<ThemeExtension>(),
        )
      )
    };

    return ThemeSwitcher(
      themes: themes,
      notifier: themeNotifier,
      child: ListenableBuilder(
        listenable: themeNotifier,
        builder: (context, widget) {
          return MaterialApp(
            theme: themeNotifier.value.theme,
            home: const Home(),
          );
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final themeSwitcher = ThemeSwitcher.of(context);

    return MaterialApp(
      theme: themeSwitcher?.notifier?.value.theme ?? ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme : ${themeSwitcher?.notifier?.value.name}'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (themeSwitcher != null) themeSwitcher.buildDropdown(context),
              const CustomCard(
                title: "lorem ipsum",
                text: "lorem ipsum dolor sit ameth",
              )
            ],
          ),
        ),
      ),
    );
  }
}
