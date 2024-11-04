part of '../screens/guide_screen.dart';

class _SuccessGuide extends StatelessWidget {
  const _SuccessGuide();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.talking,
      height: context.heightR(0.75),
    );
  }
}
