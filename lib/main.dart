import 'package:flutter/material.dart';

import 'package:flutter_themex/themex/themes/theme_a.dart';
import 'package:flutter_themex/themex/themes/theme_b.dart';
import 'package:flutter_themex/themex/themes/theme_c.dart';

import 'widgets/custom_card.dart';
import 'widgets/theme_switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultChoice = (name: "Theme A", theme: createThemeA(Theme.of(context)));
    final themeNotifier = ValueNotifier(defaultChoice);
    final themes = {
      defaultChoice,
      (
        /// theme B inherit from theme A
        name: "Theme B",
        theme: createThemeB(defaultChoice.theme),
      ),
      (
        /// theme C inherit from theme C
        name: 'Theme C',
        theme: createThemeC(defaultChoice.theme),
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
