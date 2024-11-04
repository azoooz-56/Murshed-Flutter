part of '../screens/guide_screen.dart';

class _WaitingGuide extends StatelessWidget {
  const _WaitingGuide();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.waiting,
      height: context.heightR(0.75),
    );
  }
}
