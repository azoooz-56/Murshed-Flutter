part of '../screens/on_boarding_screen.dart';

class _WelcomeGuide extends StatelessWidget {
  const _WelcomeGuide();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.guideWelcome,
      height: context.heightR(0.6),
    );
  }
}
