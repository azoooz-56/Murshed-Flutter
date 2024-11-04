part of '../screens/guide_screen.dart';

class _SuccessWidget extends ConsumerWidget {
  final List<Questions> questions;
  final Country country;

  const _SuccessWidget({
    required this.questions,
    required this.country,
  });

  Future<void> _launchUrl(String url) async {
    Logger().w(url);
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool isThereImages = (questions.last.answer?.images != null && !(questions.last.answer?.images?.isEmpty ?? true) );
    bool isThereLocation = (questions.last.answer?.location != null && !(questions.last.answer?.location?.isEmpty ?? true) );
    bool isThereVideos = (questions.last.answer?.video != null && !(questions.last.answer?.video?.isEmpty ?? true) );

    final isSuggestionClicked =
        ref.watch(ActionsController.isSuggestionClickedProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (questions.last.answer?.location != null && !(questions.last.answer?.location?.isEmpty ?? true))
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(onTap: (){
              _launchUrl(questions.last.answer?.location ?? "");
            } ,child: AssetsImagesWidget(AppAssets.mapLocation)),
          ),
        if (questions.last.answer?.images != null)
          Align(
            alignment: Alignment.topLeft,
            child: Images(questions.last.answer?.images?.first ?? ""),
          ),
        if (questions.last.answer?.video != null && !(questions.last.answer?.video?.isEmpty ?? true))
          GestureDetector(
            onTap: ()=> _launchUrl(questions.last.answer?.video ?? ""),
            child: Align(
              alignment: Alignment.topLeft,
              child: AssetsImagesWidget(AppAssets.videoImage ?? ""),
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(top:  (isThereImages || isThereLocation || isThereVideos) ?  0 : 250.h),
              child: Align(
                  alignment: Alignment.bottomCenter, child: _ChatList(questions)),
            ),
          ),

        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: isSuggestionClicked
              ? _SuggestionsList(
                  LogicHelpers.getSuggestionList(country.title.ar),
              country
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
