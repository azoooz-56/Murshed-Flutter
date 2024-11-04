import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:murshed/core/components/custom_app_bar.dart';
import 'package:murshed/core/components/custom_button.dart';
import 'package:murshed/core/components/murshed.dart';
import 'package:murshed/core/themes/app_assets.dart';
import 'package:murshed/core/utilities/extensions.dart';
import 'package:murshed/features/settings/screens/language_selection_screen.dart';
import 'package:murshed/generated/locale_keys.g.dart';

part '../widgets/map.dart';

part '../widgets/get_started.dart';

part '../widgets/welcome_guide.dart';

part '../widgets/welcome_title.dart';

class OnBoardingScreen extends ConsumerWidget {
  OnBoardingScreen({super.key});

  static const routePath = '/onBoarding';

  static const routeName = 'OnBoarding';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnimationClicked = ref.watch(isClicked);
    return Scaffold(
      backgroundColor: context.appTheme.secondaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            AnimatedPadding(
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.only(top: isAnimationClicked ? 30.h : 0),
              child: const Murshed(),
            ),
            GestureDetector(
              onTap: () =>
                  ref.read(isClicked.notifier).state = !isAnimationClicked,
              child: SizedBox(
                height: context.heightR(0.6),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      bottom: isAnimationClicked ? 120.h : 30.h,
                      left: 0,
                      right: 0,
                      child: _Map(),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: isAnimationClicked ? 0 : 1,
                      child: Center(child: _WelcomeGuide()),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      bottom: isAnimationClicked ? 10.h : 90.h,
                      left: 0,
                      right: 0,
                      child: _WelcomeTitle(),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: isAnimationClicked ? 0 : 1,
              child: _GetStarted(),
            ),
          ],
        ),
      ),
    );
  }
}

final isClicked = StateProvider((ref) => false);
