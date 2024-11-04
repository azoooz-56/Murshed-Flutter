part of '../screens/on_boarding_screen.dart';

class _GetStarted extends StatelessWidget {
  const _GetStarted();

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onClick: () {
        context.push(LanguageSelectionScreen.routePath);
      },
      title: LocaleKeys.onBoarding_start.tr(),
    );
  }
}
