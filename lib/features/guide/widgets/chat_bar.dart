part of '../screens/guide_screen.dart';

class _ChatBar extends ConsumerWidget {
  const _ChatBar({required this.city});
  final Country city;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final chatController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              // readOnly: true,
              controller: chatController,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){

                  ref.read(GuideNotifier.provider.notifier).askQuestion(chatController.text, city , context.isArabic ? "Arabic" : "English");
                  ref.invalidate(ActionsController.isChatClickedProvider);
                  ref.invalidate(
                      ActionsController.isSuggestionClickedProvider);
                  ref.invalidate(ActionsController.isMicClickedProvider);
                }, icon: Icon(Icons.send, color: Color(0xFF574c42),)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(
                              ActionsController.isChatClickedProvider.notifier)
                          .state = false;
                    },
                    child: SvgPicture.asset(AppAssets.chatMic),
                  ),
                ),

                hintText: LocaleKeys.guide_hintChat.tr(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ref
                      .read(ActionsController.isSuggestionClickedProvider.notifier)
                      .state =
                  !ref.watch(ActionsController.isSuggestionClickedProvider);
            },
            child: SvgPicture.asset(
              AppAssets.lampLight,
              height: 50.h,
              width: 50.w,
            ),
          ),
        ],
      ),
    );
  }
}
