import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed/features/guide/models/questions.dart';

class ChatNotifier extends ChangeNotifier {
  static final provider = ChangeNotifierProvider(
    (ref) => ChatNotifier(),
  );

  ChatNotifier();

  List<Questions> _messages = [];

  List<Questions> get messages => _messages;

  set messages(List<Questions> value) {
    _messages = value;
    notifyListeners();
  }
}
