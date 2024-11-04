// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appName": "Murshed",
  "onBoarding": {
    "helloTitle": "Hello, I'm Murshed",
    "helloSubTitle": "Your Tour Guide",
    "start": "Start",
    "subTitle": "Get an exceptional tourist experience\nand discover the beauty of unique tourist destinations\nin Saudi Arabia 🇸🇦"
  },
  "languageSelection": {
    "title": "Choose the language you\nprefer",
    "arabic": "العربية",
    "english": "English",
    "next": "Next"
  },
  "home": {
    "selectLanguage": "Select Country",
    "country1": "Riyadh",
    "country2": "Mecca",
    "country3": "Madinah",
    "country4": "Eastern Province",
    "country5": "Asir",
    "country6": "Al-Qassim",
    "country7": "Tabuk",
    "country8": "Al-Jouf",
    "country9": "Najran",
    "country10": "Jazan",
    "country11": "Hail",
    "country12": "Northern Borders",
    "country13": "Al-Baha"
  },
  "guide": {
    "hintChat": "Ask a question"
  }
};
static const Map<String,dynamic> ar = {
  "appName": "Murshed",
  "onBoarding": {
    "helloTitle": "اهلاً أنا مرشد",
    "helloSubTitle": "مرشدك السياحي",
    "start": "ابدأ",
    "subTitle": "احصل على تجربة سياحية استثنائية\nواكتشف جمال الأماكن السياحية\nالفريدة في المملكة العربية السعودية 🇸🇦"
  },
  "languageSelection": {
    "title": "أختر اللغة التي تفضلها",
    "arabic": "العربية",
    "english": "English",
    "next": "التالي"
  },
  "home": {
    "selectLanguage": "إختر المدينة",
    "country1": "الرياض",
    "country2": "مكة المكرمة",
    "country3": "المدينة المنورة",
    "country4": "الشرقية",
    "country5": "عسير",
    "country6": "القصيم",
    "country7": "تبوك",
    "country8": "الجوف",
    "country9": "نجران",
    "country10": "جازان",
    "country11": "حائل",
    "country12": "الحدود الشمالية",
    "country13": "الباحة"
  },
  "guide": {
    "hintChat": "أكتب سؤالك"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
