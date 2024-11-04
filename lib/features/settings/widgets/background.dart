part of '../screens/language_selection_screen.dart';

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Image.asset(
        AppAssets.map,
        height: context.heightR(0.5),
      ),
    );
  }
}
