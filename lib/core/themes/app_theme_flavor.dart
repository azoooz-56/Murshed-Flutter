import 'package:flutter/material.dart';
import 'package:murshed/core/themes/flavors/dark/dark_theme.dart';
import 'package:murshed/core/themes/flavors/light/light_theme.dart';
import 'package:murshed/core/utilities/enums.dart';

abstract class AppThemeFlavor {
  factory AppThemeFlavor(ThemeFlavor themeFlavor) {
    switch (themeFlavor) {
      case ThemeFlavor.light:
        return LightTheme();
      case ThemeFlavor.dark:
        return DarkTheme();
      default:
        return LightTheme();
    }
  }

  Brightness get windowBrightness;

  ThemeData createThemeData(BuildContext context);

  @protected
  AppThemeFlavor.init();
}
