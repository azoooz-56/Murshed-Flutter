part of '../screens/guide_screen.dart';

class _WelcomeGuide extends StatelessWidget {
  const _WelcomeGuide();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.idle,
      height: context.heightR(0.75),
    );
  }
}
