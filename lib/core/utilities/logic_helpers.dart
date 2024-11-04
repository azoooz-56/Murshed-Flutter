import 'package:murshed/features/guide/models/questions.dart';

mixin LogicHelpers {
  static List<Questions> getSuggestionList(String country) {
    if (country == 'جدة') {
      return Questions.jeddahQuestions;
    } else if (country == 'الطائف') {
      return Questions.taifQuestions;
    } else {
      return Questions.mekkahQuestions;
    }
  }
}
