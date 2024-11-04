part of '../screens/guide_screen.dart';

class _SuggestionsList extends StatelessWidget {
  final List<Questions> questions;
  final Country country;

  const _SuggestionsList(this.questions, this.country);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return _SuggestCard(question, country);
        },
      ),
    );
  }
}

class _SuggestCard extends ConsumerWidget {
  final Questions question;
  final Country country;

  const _SuggestCard(this.question, this.country);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(GuideNotifier.provider.notifier).askQuestion(question.question.getValueByCurrentLanguage(context) , country , context.isArabic ? "Arabic" : "English" );
        ref.invalidate(ActionsController.isChatClickedProvider);
        ref.invalidate(
            ActionsController.isSuggestionClickedProvider);
        ref.invalidate(ActionsController.isMicClickedProvider);
      },
      child: Card(
        color: context.appTheme.white.withOpacity(.79),
        surfaceTintColor: context.appTheme.white.withOpacity(.79),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
          side: BorderSide(
            color: Color(0XFF717171),
          ),
        ),
        child: IgnorePointer(
          child: ListTile(
            dense: false,
            title: Text(
              question.question.getValueByCurrentLanguage(context),
              style: context.appTextStyles.titleMedium
                  .copyWith(color: Color(0xff574D41)),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Color(0xFF574D41),
            ),
          ),
        ),
      ),
    );
  }
}
