part of '../screens/language_selection_screen.dart';

class _LanguageButtons extends ConsumerWidget {
  const _LanguageButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: _LanguageButton(
              currentIndex: 0,
              onClick: () async {
                await context.setLocale(AppLocale.arabic);
                ref.read(isLanguageButtonClicked.notifier).state = 0;
                ref.read(isButtonGridSelected.notifier).state = -1;
              },
              title: LocaleKeys.languageSelection_arabic.tr(),
              icon: AppAssets.arabic,
            ),
          ),
          20.horizontalSpace,
          Expanded(
            child: _LanguageButton(
              currentIndex: 1,
              onClick: () async {
                await context.setLocale(AppLocale.english);

                ref.read(isLanguageButtonClicked.notifier).state = 1;
                ref.read(isButtonGridSelected.notifier).state = -1;
              },
              title: LocaleKeys.languageSelection_english.tr(),
              icon: AppAssets.english,
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageButton extends ConsumerWidget {
  final VoidCallback onClick;
  final String title;
  final String icon;
  final int currentIndex;

  const _LanguageButton({
    required this.onClick,
    required this.title,
    required this.icon,
    this.currentIndex = -1,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isClicked = ref.watch(isLanguageButtonClicked) == currentIndex;
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: context.appTheme.secondaryBackground,
          borderRadius: BorderRadius.circular(36.r),
          border: Border.all(
            color: isClicked
                ? context.appTheme.entryScreenButtons
                : context.appTheme.languageSelectionButton.withOpacity(0.55),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: context.appTextStyles.displaySmall,
              ),
              Image.asset(
                icon,
                height: context.heightR(.09),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
