import 'package:flutter/material.dart';
import 'package:murshed/core/themes/app_sizes.dart';
import 'package:murshed/core/themes/app_text_styles.dart';
import 'package:murshed/core/themes/app_theme_flavor.dart';
import 'package:murshed/core/themes/data.dart';
import 'package:murshed/core/utilities/extensions.dart';

part 'dark_color.dart';

class DarkTheme extends AppThemeFlavor {
  DarkTheme() : super.init();

  @override
  ThemeData createThemeData(BuildContext context) {
    final appSizes = context.isTablet ? AppSizes.tablet() : AppSizes.mobile();
    final appTextStyle =
        context.isTablet ? AppTextStyles.tablet() : AppTextStyles.mobile();

    final textTheme = appTextStyle.toTextTheme().apply(
          fontFamily: 'Inter',
          displayColor: _DarkColors.white,
          bodyColor: _DarkColors.white,
          decorationColor: _DarkColors.white,
        );
    return ThemeData.from(colorScheme: ColorScheme.fromSwatch()).copyWith(
      scaffoldBackgroundColor: _DarkColors.white,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        color: _DarkColors.black,
        foregroundColor: _DarkColors.white,
        elevation: 0,
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: _DarkColors.white,
        labelColor: _DarkColors.white,
      ),
      dividerColor: _DarkColors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _DarkColors.blue,
          foregroundColor: _DarkColors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle:
            context.textTheme.bodyMedium!.copyWith(color: _DarkColors.white),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white38,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white38,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white38,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white38,
          ),
        ),
      ),
      extensions: [
        appTextStyle,
        appSizes,
        AppThemeData(
          white: _DarkColors.white,
          black: _DarkColors.black,
          blue: _DarkColors.blue,
          primary: _DarkColors.primary,
          primaryVariant: _DarkColors.primaryVariant,
          secondary: _DarkColors.secondary,
          secondaryVariant: _DarkColors.secondaryVariant,
          error: _DarkColors.error,
          primaryError: _DarkColors.secondaryVariant,
          secondaryError: _DarkColors.secondaryVariant,
          success: _DarkColors.success,
          primarySuccess: _DarkColors.secondaryVariant,
          secondarySuccess: _DarkColors.secondaryVariant,
          warning: _DarkColors.secondaryVariant,
          background: _DarkColors.background,
          secondaryBackground: _DarkColors.secondaryVariant,
          entryScreenButtons: _DarkColors.secondaryVariant,
          languageSelectionButton: _DarkColors.secondaryVariant,
          ads: _DarkColors.secondaryVariant,
          adsPrimary: _DarkColors.secondaryVariant,
          adsSecondary: _DarkColors.secondaryVariant,
        ),
      ],
    );
  }

  @override
  Brightness get windowBrightness => Brightness.dark;
}
