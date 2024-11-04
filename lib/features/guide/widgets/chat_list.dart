part of '../screens/guide_screen.dart';

class _ChatList extends ConsumerWidget {
  final List<Questions> questions;

  const _ChatList(this.questions);

  @override
  Widget build(BuildContext context, ref) {
    final ScrollController _scrollController = ScrollController();


    return WidgetLifecycleListener(
      onInit: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        });
      },
      onDispose: () {
        _scrollController.dispose();
      },

      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          children: List.generate(
            questions.length * 2,
            (index) {
              final questionIndex = index ~/ 2;
              final isQuestion = index.isEven;

              final message = isQuestion
                  ? questions[questionIndex]
                      .question
                      .getValueByCurrentLanguage(context)
                  : questions[questionIndex]
                      .answer?.answer;

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: isQuestion
                    ? _Sender(message: message ?? "")
                    : _Receiver(message: message ?? ""),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class _Sender extends StatelessWidget {
  final String message;

  const _Sender({this.message = 'test'});

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message,
      constraints: BoxConstraints(
        maxWidth: context.widthR(.7),
      ),
      color: Color.fromRGBO(
        232,
        222,
        200,
        .82,
      ),
      isSender: false,
    );
  }
}

class _Receiver extends StatelessWidget {
  final String message;

  const _Receiver({this.message = 'test'});

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message,
      constraints: BoxConstraints(
        maxWidth: context.widthR(.7),
      ),
      color: Color.fromRGBO(
        255,
        255,
        255,
        .95,
      ),
      isSender: true,
    );
  }
}
