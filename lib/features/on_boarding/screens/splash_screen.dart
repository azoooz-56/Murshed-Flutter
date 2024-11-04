import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:murshed/core/themes/app_assets.dart';
import 'package:murshed/core/utilities/extensions.dart';
import 'package:murshed/features/on_boarding/screens/on_boarding_screen.dart';

class SplashScreen extends ConsumerWidget {
  SplashScreen();

  static const routePath = '/splash';

  static const routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoPosition = ref.watch(_logoAnimate);
    final leftOnBoardingPosition = ref.watch(_leftOnBoarding);
    final centerOnBoardingPosition = ref.watch(_centerOnBoarding);
    final rightOnBoardingPosition = ref.watch(_rightOnBoarding);
    final textAnimation = ref.watch(_textAnimate);
    final circleAnimation = ref.watch(_circleAnimate);

    Future.delayed(Duration(seconds: 3), () {
      ref.read(_logoAnimate.notifier).state = context.heightR(-.5);
      ref.read(_centerOnBoarding.notifier).state = context.heightR(-.5);
      ref.read(_circleAnimate.notifier).state = context.height * 1.5;
      ref.read(_leftOnBoarding.notifier).state = -context.width;
      ref.read(_rightOnBoarding.notifier).state = -context.width;
      ref.read(_textAnimate.notifier).state = 0;
    });

    Future.delayed(Duration(seconds: 6), () {
      context.go(OnBoardingScreen.routePath);
    });

    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            left: 0,
            right: 0,
            top: logoPosition,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.appLogo,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation / 2,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation / 4,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation / 8,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation / 26,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation / 32,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation / 64,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation / 128,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation / 256,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation / 350,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            height: context.heightR(0.5),
            width: context.width,
            bottom: circleAnimation / 500,
            curve: Curves.easeInOut,
            child: Image.asset(
              AppAssets.circle,
            ),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            left: leftOnBoardingPosition,
            height: context.heightR(0.4),
            bottom: leftOnBoardingPosition,
            curve: Curves.easeInOut,
            child: Image.asset(AppAssets.onBoardingLeft),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            left: 0,
            right: 0,
            height: context.heightR(0.45),
            bottom: centerOnBoardingPosition,
            curve: Curves.easeInOut,
            child: Image.asset(AppAssets.onBoardingCenter),
            duration: Duration(seconds: 3),
          ),
          AnimatedPositioned(
            right: rightOnBoardingPosition,
            height: context.heightR(0.4),
            bottom: rightOnBoardingPosition,
            curve: Curves.easeInOut,
            child: Image.asset(AppAssets.onBoardingRight),
            duration: Duration(seconds: 3),
          ),
        ],
      ),
    );
  }

  final _logoAnimate = StateProvider((ref) => 150.h);
  final _textAnimate = StateProvider((ref) => 1.0);
  final _leftOnBoarding = StateProvider((ref) => 0.0);
  final _centerOnBoarding = StateProvider((ref) => 0.0);
  final _rightOnBoarding = StateProvider((ref) => 0.0);
  final _circleAnimate = StateProvider((ref) => 0.0);
}
