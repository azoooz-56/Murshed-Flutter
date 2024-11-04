part of '../screens/on_boarding_screen.dart';

class _WelcomeTitle extends ConsumerWidget {
  _WelcomeTitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnimationClicked = ref.watch(isClicked);
    final isAnimationFinished = ref.watch(isFinished);
    ref.listen(isClicked, (previous, next) async {
      if (next) {
        ref.read(isFinished.notifier).state = true;
        await Future.delayed(Duration(milliseconds: 500));
        ref.read(isFinished.notifier).state = false;
      }
    });
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color: context.appTheme.white.withOpacity(0.5),
        border: Border.all(
          color: context.appTheme.entryScreenButtons,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: AnimatedOpacity(
        duration: Duration(seconds: 500),
        opacity: isAnimationFinished ? 1 : 0,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: isAnimationClicked ? _SubTitle() : _Title(),
        ),
      ),
    );
  }

  final isFinished = StateProvider((ref) => true);
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.onBoarding_helloTitle.tr(),
              style: context.appTextStyles.displayMedium
                  .copyWith(fontSize: 28.spMin, height: 0),
              textAlign: TextAlign.center,
            ),
            10.horizontalSpace,
            SvgPicture.asset(AppAssets.wave),
          ],
        ),
        Text(
          LocaleKeys.onBoarding_helloSubTitle.tr(),
          style: context.appTextStyles.displayMedium
              .copyWith(fontSize: 28.spMin, height: 0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.onBoarding_subTitle.tr(),
      style: context.appTextStyles.displayMedium
          .copyWith(fontSize: 28.spMin, height: 0),
      textAlign: TextAlign.center,
    );
    /// With animation if needed
    // return AnimatedTextKit(
    //   animatedTexts: [
    //     TypewriterAnimatedText(
    //       LocaleKeys.onBoarding_subTitle.tr(),
    //       textStyle: context.appTextStyles.displayMedium
    //           .copyWith(fontSize: 26.spMin, height: 0),
    //       textAlign: TextAlign.center,
    //       cursor: '',
    //     ),
    //   ],
    //   isRepeatingAnimation: false,
    // );
  }
}
