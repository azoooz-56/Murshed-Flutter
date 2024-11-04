import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murshed/core/themes/app_sizes.dart';
import 'package:murshed/core/themes/app_text_styles.dart';
import 'package:murshed/core/themes/app_theme_flavor.dart';
import 'package:murshed/core/themes/data.dart';
import 'package:murshed/core/utilities/extensions.dart';

part 'light_color.dart';

class LightTheme extends AppThemeFlavor {
  LightTheme() : super.init();

  @override
  ThemeData createThemeData(BuildContext context) {
    final appSizes = context.isTablet ? AppSizes.tablet() : AppSizes.mobile();
    final appTextStyle =
        context.isTablet ? AppTextStyles.tablet() : AppTextStyles.mobile();

    final textTheme = appTextStyle.toTextTheme().apply(
          fontFamily: 'Inter',
          displayColor: _LightColors.black,
          bodyColor: _LightColors.black,
          decorationColor: _LightColors.black,
        );
    return ThemeData.from(colorScheme: ColorScheme.fromSwatch()).copyWith(
      scaffoldBackgroundColor: _LightColors.background,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 10,
        foregroundColor: _LightColors.primary,
        surfaceTintColor: _LightColors.white,
        backgroundColor: _LightColors.background,
        titleSpacing: 0,
        titleTextStyle: appTextStyle.headlineLarge.copyWith(
          color: _LightColors.primary,
        ),
      ),
      dividerColor: Colors.grey.shade100,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _LightColors.primary,
          foregroundColor: _LightColors.white,
          textStyle: appTextStyle.subheadLarge,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color>(_LightColors.white),
        checkColor: MaterialStateProperty.all<Color>(_LightColors.white),
        overlayColor: MaterialStateProperty.all<Color>(
          _LightColors.white,
        ),
        side: BorderSide(
          color: _LightColors.secondaryVariant,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _LightColors.background,
        unselectedItemColor: _LightColors.secondaryVariant,
        selectedItemColor: _LightColors.primary,
        enableFeedback: false,
        elevation: 1,
      ),
      cardTheme: CardTheme(
        color: _LightColors.white,
        surfaceTintColor: _LightColors.white,
        elevation: 0,
      ),
      iconTheme: IconThemeData(
        color: _LightColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _LightColors.white,
        suffixIconColor: _LightColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0XFF717171),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0XFF717171),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0XFF717171),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0XFF717171),
          ),
        ),
        iconColor: _LightColors.primary,
        prefixIconColor: const Color(0xFF3a3a6e),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: _LightColors.primary,
        labelStyle: appTextStyle.titleLarge,
        unselectedLabelColor: _LightColors.black,
        unselectedLabelStyle: appTextStyle.titleMedium,
        indicatorColor: _LightColors.primary,
        dividerColor: _LightColors.white.withOpacity(0.2),
      ),
      extensions: [
        appTextStyle,
        appSizes,
        AppThemeData(
          white: _LightColors.white,
          black: _LightColors.black,
          blue: _LightColors.blue,
          primary: _LightColors.primary,
          primaryVariant: _LightColors.primaryVariant,
          secondary: _LightColors.secondary,
          secondaryVariant: _LightColors.secondaryVariant,
          error: _LightColors.error,
          primaryError: _LightColors.errorPrimary,
          secondaryError: _LightColors.errorSecondary,
          success: _LightColors.success,
          primarySuccess: _LightColors.successPrimary,
          secondarySuccess: _LightColors.successSecondary,
          warning: _LightColors.warning,
          background: _LightColors.background,
          secondaryBackground: _LightColors.secondaryBackground,
          entryScreenButtons: _LightColors.entryScreenButtons,
          languageSelectionButton: _LightColors.languageSelectionButton,
          ads: _LightColors.ads,
          adsPrimary: _LightColors.adsPrimary,
          adsSecondary: _LightColors.adsSecondary,
        ),
      ],
    );
  }

  @override
  Brightness get windowBrightness => Brightness.dark;
}
