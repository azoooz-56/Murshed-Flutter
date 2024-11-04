part of '../screens/guide_screen.dart';

class _Options extends HookConsumerWidget {
   _Options({required this.city});

   final Country city;
  final SpeechToText speech = SpeechToText();
   String _currentLocaleId = '';
   double minSoundLevel = 50000;
   double maxSoundLevel = -50000;

   AudioPlayer audioPlayer = AudioPlayer();
   late AwsClientCredentials credentials = AwsClientCredentials(
       accessKey: "AKIA3HKDKTIDXDFRZLXB",
       secretKey: "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");
   late Polly service = Polly(region: "us-east-1", credentials: credentials);






  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final _hasSpeech = useState(false);
    final isGptInRequest = useState(false);
    final isSpeekignTTS = useState(false);
    final lastWord = useState('');
    final levelSound = useState(0.0);

    final isLampClicked =
        ref.watch(ActionsController.isSuggestionClickedProvider);

    void errorListener(SpeechRecognitionError error) {
      Logger().w(
          'Received error status: $error, listening: ${speech.isListening}');
      isSpeekignTTS.value = false;
    }
    void statusListener(String status) {
      Logger().w(
          'Received listener status: $status, listening: ${speech.isListening}');

    }

    Future<void> initSpeechState() async {
      Logger().w('Initialize');
      try {
        var hasSpeech = await speech.initialize(
          onError: errorListener,
          onStatus: statusListener,
        );
        if (hasSpeech) {
          // Get the list of languages installed on the supporting platform so they
          // can be displayed in the UI for selection by the user.

          var systemLocale = await speech.systemLocale();
          _currentLocaleId = systemLocale?.localeId ?? '';
        }
        _hasSpeech.value = hasSpeech;
      } catch (e) {
        _hasSpeech.value = false;
      }
    }





    void soundLevelListener(double level) {
      minSoundLevel = min(minSoundLevel, level);
      maxSoundLevel = max(maxSoundLevel, level);
      // _logEvent('sound level $level: $minSoundLevel - $maxSoundLevel ');
      levelSound.value = level;
    }

    /// This callback is invoked each time new recognition results are
    /// available after `listen` is called.
    Future<void> resultListener(SpeechRecognitionResult result) async {
      Logger().w(
          'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
      Logger().w(result.recognizedWords);
      lastWord.value = (result.recognizedWords);


      if (!speech.isListening) {
        isGptInRequest.value = true;
        isSpeekignTTS.value = false;

        Logger().w("message");
       final ans = await ref.read(GuideNotifier.provider.notifier).askQuestion(lastWord.value, city , context.isArabic ? "Arabic" : "English");
        ref.invalidate(ActionsController.isChatClickedProvider);
        ref.invalidate(
            ActionsController.isSuggestionClickedProvider);
        ref.invalidate(ActionsController.isMicClickedProvider);
        isSpeekignTTS.value = false;
        isGptInRequest.value = false;
        // lastWord.value = (gptRes);


        // await speek(lastWords: ans ?? "", service: service, player: audioPlayer);
        // audioPlayer.onPlayerComplete.listen((event) {
        //
        //   Logger().w("after complete");
        //   isSpeekignTTS.value = false;
        //
        // });
      }
    }


    initAwsPolly() {
      credentials = AwsClientCredentials(
          accessKey: "AKIA3HKDKTIDXDFRZLXB",
          secretKey: "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");

      service = Polly(region: "us-east-1", credentials: credentials);
    }

    void startListening() {
      final TextEditingController _pauseForController =
      TextEditingController(text: '3');
      final TextEditingController _listenForController =
      TextEditingController(text: '30');

      Logger().w('start listening');
      lastWord.value = '';
      // lastError = '';
      final pauseFor = int.tryParse(_pauseForController.text);
      final listenFor = int.tryParse(_listenForController.text);
      // Note that `listenFor` is the maximum, not the minimum, on some
      // systems recognition will be stopped before this value is reached.
      // Similarly `pauseFor` is a maximum not a minimum and may be ignored
      // on some devices.
      speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: listenFor ?? 30),
        pauseFor: Duration(seconds: pauseFor ?? 3),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.search,
        onDevice: false,
      );
      isSpeekignTTS.value = true;
      // setState(() {});
    }

    useEffect((){
      initAwsPolly();
    },[]);





    return isSpeekignTTS.value || isGptInRequest.value ? Column(
      children: [
        RecognitionResultsWidget(lastWords: lastWord.value, level: levelSound.value),

        !isSpeekignTTS.value ? SizedBox() : Image.asset(AppAssets.speachListening),
      ],
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            ref
                .read(ActionsController
                .isChatClickedProvider.notifier)
                .state = true;
          },
          child: SvgPicture.asset(
            AppAssets.chat,
            height: 30.h,
            width: 30.w,
          ),
        ),
        20.horizontalSpace,
        GestureDetector(
          onTap: () async {
            if (!_hasSpeech.value) {
              await initSpeechState();
            }

            if (!_hasSpeech.value || speech.isListening) {
            } else {
              startListening();
            }
          },
          child: SvgPicture.asset(
            AppAssets.mic,
            height: 80.h,
            width: 80.w,
          ),
        ),
        10.horizontalSpace,
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: isLampClicked
              ? GestureDetector(
                  onTap: () {
                    ref
                        .read(ActionsController
                            .isSuggestionClickedProvider.notifier)
                        .state = false;
                  },
                  child: SvgPicture.asset(
                    AppAssets.lampLight,
                    height: 50.h,
                    width: 50.w,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    ref
                        .read(ActionsController
                            .isSuggestionClickedProvider.notifier)
                        .state = true;
                  },
                  child: SvgPicture.asset(
                    AppAssets.lamp,
                    height: 50.h,
                    width: 50.w,
                  ),
                ),
        ),
        10.horizontalSpace,
      ],
    );
  }
}


/// Displays the most recently recognized words and the sound level.
class RecognitionResultsWidget extends StatelessWidget {
  const RecognitionResultsWidget({
    Key? key,
    required this.lastWords,
    required this.level,
  }) : super(key: key);

  final String lastWords;
  final double level;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 120,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Container(
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color:   Colors.grey.withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    lastWords,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

