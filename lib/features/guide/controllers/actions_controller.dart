import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionsController {
  static final isSuggestionClickedProvider =
      StateProvider.autoDispose((ref) => false);
  static final isChatClickedProvider =
      StateProvider.autoDispose((ref) => false);
  static final isMicClickedProvider = StateProvider.autoDispose((ref) => false);
  static final isTalkingProvider = StateProvider.autoDispose((ref) => false);
}
