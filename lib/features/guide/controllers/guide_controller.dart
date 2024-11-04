import 'package:audioplayers/audioplayers.dart';
import 'package:aws_polly_api/polly-2016-06-10.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:murshed/core/notifiers/global_state.dart';
import 'package:murshed/features/guide/controllers/actions_controller.dart';
import 'package:murshed/features/guide/controllers/chat_notifier.dart';
import 'package:murshed/features/guide/data/services/vectara_services.dart';
import 'package:murshed/features/guide/models/questions.dart';
import 'package:murshed/features/home/models/country.dart';
import 'package:murshed/features/home/models/translation.dart';

class GuideNotifier extends StateNotifier<GlobalStates<List<Questions>>> {
  static final provider =
  StateNotifierProvider<GuideNotifier, GlobalStates<List<Questions>>>(
        (ref) => GuideNotifier(
      ref.watch(ChatNotifier.provider), ref
    ),
  );
  final ChatNotifier chatNotifier;
  AudioPlayer audioPlayer = AudioPlayer();
  late AwsClientCredentials credentials = AwsClientCredentials(
      accessKey: "AKIA3HKDKTIDXDFRZLXB",
      secretKey: "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");
  late Polly service = Polly(region: "us-east-1", credentials: credentials);
  final Ref ref;

  GuideNotifier(
      this.chatNotifier,
      this.ref
      ) : super(GlobalStates.initial());

  Future<String?> askQuestion(String query, Country city,  String lang) async {
    print(query);
    state = GlobalStates.loading();
    int retries = 3;

    while (retries > 0) {
      try {
        final ans = await VectaraServices.searchQueryVectara(query , lang, city);
        final ques = Questions(
          question: Translation(ar: query, en: query),
          answer: ans,
          relatedCity: null,
        );
        final currentState = chatNotifier.messages;
        final updatedQuestions = currentState
          ..add(ques);
        await speek(lastWords: ans?.answer ?? "", questionsList: updatedQuestions );

        print(updatedQuestions.toString());
        return ans?.answer; // Break out of the loop if the request is successful
      } on Exception catch (e) {
        Logger().w(e.toString());

        retries--;
        if (retries == 0) {
          state = GlobalStates.fail();
          state = GlobalStates.initial();
          Logger().w(e.toString());
        }
      }
    }
    return null;
  }

  Future<void> speek({
    required String lastWords,
    required List<Questions> questionsList,
  }) async {
    print(lastWords);
    var resp = await service.synthesizeSpeech(
        outputFormat: OutputFormat.mp3,
        text: lastWords,
        textType: TextType.text,
        voiceId: VoiceId.zayd,
        engine: Engine.neural);

    await audioPlayer.setSourceBytes(resp.audioStream!);
    state = GlobalStates.success(questionsList);
    ref.read(ActionsController.isTalkingProvider.notifier).state = true;
    await audioPlayer.play(audioPlayer.source!);
    audioPlayer.onPlayerComplete.listen((event) {
      Logger().w(audioPlayer.state.toString());
      Logger().w("after");
      ref.read(ActionsController.isTalkingProvider.notifier).state = false;

    });

  }


}
