import 'package:flutter/material.dart';

typedef ThemeChoice = ({String name, ThemeData theme});

class ThemeSwitcher extends InheritedNotifier<ValueNotifier<ThemeChoice>> {
  final Set<ThemeChoice> themes;

  const ThemeSwitcher({
    super.key,
    required super.child,
    required super.notifier,
    required this.themes,
  });

  static ThemeSwitcher? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>();
  }

  Widget buildDropdown(BuildContext context) {
    return DropdownButton<ThemeChoice>(
        value: notifier?.value,
        items: themes
            .map(
              (item) => DropdownMenuItem<ThemeChoice>(
                value: item,
                child: Text(item.name),
              ),
            )
            .toList(),
        onChanged: (choice) {
          if (choice != null) notifier?.value = choice;
        });
  }
}
