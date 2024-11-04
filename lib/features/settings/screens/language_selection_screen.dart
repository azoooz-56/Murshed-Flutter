import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:murshed/core/components/custom_button.dart';
import 'package:murshed/core/components/murshed.dart';
import 'package:murshed/core/themes/app_assets.dart';
import 'package:murshed/core/utilities/extensions.dart';
import 'package:murshed/core/utilities/locale.dart';
import 'package:murshed/features/home/screens/home_screen.dart';
import 'package:murshed/features/on_boarding/providers/on_boarding_provider.dart';
import 'package:murshed/generated/locale_keys.g.dart';

part '../widgets/background.dart';

part '../widgets/language_buttons.dart';

class LanguageSelectionScreen extends ConsumerWidget {
  const LanguageSelectionScreen({super.key});

  static const routePath = '/languageSelection';

  static const routeName = 'LanguageSelection';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isClicked = ref.watch(isLanguageButtonClicked) != -1;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: _Background(),
            ),
            Center(
              child: Column(
                children: [
                  40.verticalSpace,
                  Murshed(),
                  40.verticalSpace,
                  Text(
                    LocaleKeys.languageSelection_title.tr(),
                    style: context.appTextStyles.displaySmall
                        .copyWith(fontSize: 28.spMin, height: 0),
                    textAlign: TextAlign.center,
                  ),
                  20.verticalSpace,
                  _LanguageButtons(),
                  40.verticalSpace,
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: isClicked ? 1 : 0,
                    child: CustomButton(
                      title: LocaleKeys.languageSelection_next.tr(),
                      onClick: () {
                        ref.read(OnBoardingProvider.provider).skip();
                        context.go(HomeScreen.routePath);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final isLanguageButtonClicked = StateProvider.autoDispose((ref) => -1);
