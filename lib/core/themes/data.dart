import 'package:flutter/material.dart';

/*
Custom extension for appTheme to add all customizations for specific components inside this class.

For example:
If there is custom widget you need to specific color for it in light and dark mode.
You can easily call it with this extension from context by calling: 'context.appTheme.blue'
*/

typedef AppThemeExtension = ThemeExtension<AppThemeData>;

class AppThemeData extends AppThemeExtension {
  final Color black;
  final Color white;
  final Color blue;
  final Color primary;
  final Color primaryVariant;
  final Color secondary;
  final Color secondaryVariant;
  final Color error;
  final Color primaryError;
  final Color secondaryError;
  final Color success;
  final Color primarySuccess;
  final Color secondarySuccess;
  final Color languageSelectionButton;
  final Color background;
  final Color secondaryBackground;
  final Color warning;
  final Color entryScreenButtons;
  final Color ads;
  final Color adsPrimary;
  final Color adsSecondary;

  const AppThemeData({
    required this.white,
    required this.black,
    required this.blue,
    required this.primary,
    required this.primaryVariant,
    required this.secondary,
    required this.secondaryVariant,
    required this.error,
    required this.primaryError,
    required this.secondaryError,
    required this.languageSelectionButton,
    required this.entryScreenButtons,
    required this.success,
    required this.primarySuccess,
    required this.secondarySuccess,
    required this.background,
    required this.secondaryBackground,
    required this.warning,
    required this.ads,
    required this.adsPrimary,
    required this.adsSecondary,
  });

  @override
  ThemeExtension<AppThemeData> copyWith() {
    return this;
  }

  /*
  The 'lerp' method is used to linearly interpolate between two  instances.
  It takes in another  instance 'other' and a double 't' which represents
  The interpolation fraction.

  Overall, it's facilitating the blending of instance based on the linear interpolation of their properties.
  Allowing for smooth transitions or transformations between two instances.
   */

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeData) return this;

    final normT = t.clamp(0, 1).toDouble();
    Color lerpColor(Color color1, Color color2) {
      return Color.lerp(color1, color2, normT)!;
    }

    return AppThemeData(
      black: lerpColor(black, other.black),
      white: lerpColor(white, other.white),
      blue: lerpColor(blue, other.blue),
      primary: lerpColor(primary, other.primary),
      primaryVariant: lerpColor(primaryVariant, other.primaryVariant),
      secondary: lerpColor(secondary, other.secondary),
      secondaryVariant: lerpColor(secondaryVariant, other.secondaryVariant),
      error: lerpColor(error, other.error),
      primaryError: lerpColor(primaryError, other.primaryError),
      secondaryError: lerpColor(secondaryError, other.secondaryError),
      success: lerpColor(success, other.success),
      primarySuccess: lerpColor(primarySuccess, other.primarySuccess),
      secondarySuccess: lerpColor(secondarySuccess, other.secondarySuccess),
      background: lerpColor(background, other.background),
      warning: lerpColor(warning, other.warning),
      secondaryBackground: lerpColor(secondaryBackground, other.secondaryBackground),
      languageSelectionButton: lerpColor(languageSelectionButton, other.languageSelectionButton),
      entryScreenButtons: lerpColor(entryScreenButtons, other.entryScreenButtons),
      ads: lerpColor(ads, other.ads),
      adsPrimary: lerpColor(adsPrimary, other.adsPrimary),
      adsSecondary: lerpColor(adsSecondary, other.adsSecondary),
    );
  }

  List<Object?> get props => [
        black,
        white,
        blue,
        primary,
        primaryVariant,
        secondary,
        secondaryVariant,
        error,
        primaryError,
        secondaryError,
        success,
        primarySuccess,
        secondarySuccess,
        background,
        secondaryBackground,
        entryScreenButtons,
        languageSelectionButton,
        warning,
        ads,
        adsPrimary,
        adsSecondary,
      ];
}
