import 'package:murshed/features/guide/data/services/vectara_services.dart';
import 'package:murshed/features/home/models/translation.dart';

class Questions {
  final Translation question;
  final Answers? answer;
  final Translation? relatedCity;
  final String? image;
  final String? location;
  final String? qrcode;

  Questions({
    required this.question,
     this.answer,
     this.relatedCity,
    this.image,
    this.location,
    this.qrcode,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      question: Translation.fromJson(json['question']),
      answer: Answers.fromJson(json['answer']),
      relatedCity: Translation.fromJson(json['relatedCity']),
      image: json['image'],
      location: json['location'],
      qrcode: json['qrcode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question.toJson(),
      'answer': answer?.toJson(),
      'relatedCity': relatedCity?.toJson(),
      'image': image,
      'location': location,
      'qrcode': qrcode,
    };
  }

  static final mekkahQuestions = [
    Questions(
      question: Translation(
        ar: 'ما هو الحجر الأسود؟',
        en: 'What is the significance of Makkah?',
      ),

      relatedCity: Translation(ar: 'مكة المكرمة', en: 'mekkah'),
      image:
          'https://t3.ftcdn.net/jpg/03/88/66/84/360_F_388668428_DXe03WK4m7pYS2TtlNxHLk10ZX6eTpmW.jpg',
    ),
    Questions(
      question: Translation(
        ar: 'كيف يتم العناية بالحجر الأسود والإطار المحيط به؟',
        en: 'What is the best time to visit Makkah?',
      ),

      relatedCity: Translation(ar: 'مكة المكرمة', en: 'mekkah'),
      qrcode:
          "https://www.booking.com/city/sa/mecca.en.html?aid=1610684;label=mecca-kkVC6dEXlJfphcIGMw7gLgS541258792250:pl:ta:p1:p2:ac:ap:neg:fi:tikwd-299864971813:lp9112435:li:dec:dm:ppccp=UmFuZG9tSVYkc2RlIyh9YfqnDqqG8nt10AsofPfvtt0;ws=&gclid=Cj0KCQjwxqayBhDFARIsAANWRnTwI02zNzqRKOv_ozGo7845w_xQGUMPFnxNtRpPDX98xoAxiWdLQJsaAsVmEALw_wcB",
    ),
    Questions(
      question: Translation(
        ar: 'ما هو فضل الحجر الأسود',
        en: 'What is the location of the Kaaba?',
      ),

      relatedCity: Translation(ar: 'مكة المكرمة', en: 'mekkah'),
      location: 'https://maps.app.goo.gl/rqWGa5ftTyDrgT7GA',
    )
  ];

  static final jeddahQuestions = [
    Questions(
      question: Translation(
        ar: 'كيف تطورت جدة كمركز اقتصادي وسياحي في المملكة العربية السعودية؟',
        en: 'How has Jeddah developed as an economic and tourist hub in Saudi Arabia?',
      ),

      relatedCity: Translation(ar: 'جدة', en: 'Jeddah'),
      image:
      'https://cdn.arabsstock.com/uploads/images/67797/image-67797-waterfront-jeddah-kingdom-saudi-arabia-jeddah-corniche-ros-preview.jpg',
    ),
    Questions(
      question: Translation(
        ar: 'ما هو الوقت المثالي لزيارة جدة؟',
        en: 'What is the best time to visit Jeddah?',
      ),

      relatedCity: Translation(ar: 'جدة', en: 'Jeddah'),
      qrcode:
          'https://www.booking.com/searchresults.en-gb.html?ss=jeddah&ssne=Makkah&ssne_untouched=Makkah&efdco=1&label=mecca-kkVC6dEXlJfphcIGMw7gLgS541258792250%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-299864971813%3Alp9112435%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YfqnDqqG8nt10AsofPfvtt0&aid=1610684&lang=en-gb&sb=1&src_elem=sb&src=city&dest_id=-3096108&dest_type=city&ac_position=0&ac_click_type=b&ac_langcode=en&ac_suggestion_list_length=5&search_selected=true&search_pageview_id=5f4c76df8d6d0085&ac_meta=GhA1ZjRjNzZkZjhkNmQwMDg1IAAoATICZW46BmplZGRhaEAASgBQAA%3D%3D&group_adults=2&no_rooms=1&group_children=0&sb_travel_purpose=leisure',
    ),
    Questions(
      question: Translation(
        ar: 'ما هي أهم المعالم السياحية في جدة؟',
        en: 'What are the main tourist attractions in Jeddah?',
      ),

      relatedCity: Translation(ar: 'جدة', en: 'Jeddah'),
      location: 'https://maps.app.goo.gl/Eus4YkX1pbdWCdwE9',
    ),
  ];

  static final taifQuestions = [
    Questions(
      question: Translation(
        ar: 'ما أهمية الطائف؟',
        en: 'What is the significance of Taif?',
      ),

      relatedCity: Translation(ar: 'الطائف', en: 'Taif'),
      image: 'https://www.al-jazirah.com/2023/20231103/cm6000.jpg',
    ),
    Questions(
      question: Translation(
        ar: 'متى هو أفضل وقت لزيارة الطائف؟',
        en: 'When is the best time to visit Taif?',
      ),

      relatedCity: Translation(ar: 'الطائف', en: 'Taif'),
      qrcode:
          'https://www.booking.com/searchresults.en-gb.html?ss=Taif%2C+Makkah+Al+Mukarramah+Province%2C+Saudi+Arabia&ssne=Taba&ssne_untouched=Taba&efdco=1&label=mecca-kkVC6dEXlJfphcIGMw7gLgS541258792250%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-299864971813%3Alp9112435%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YfqnDqqG8nt10AsofPfvtt0&aid=1610684&lang=en-gb&sb=1&src_elem=sb&src=searchresults&dest_id=-3093456&dest_type=city&ac_position=0&ac_click_type=b&ac_langcode=en&ac_suggestion_list_length=5&search_selected=true&search_pageview_id=f8317941a3f30400&ac_meta=GhBmODMxNzk0MWEzZjMwNDAwIAAoATICZW46BFRhaWZAAEoAUAA%3D&group_adults=2&no_rooms=1&group_children=0',
    ),
    Questions(
      question: Translation(
        ar: 'ما هي المعالم السياحية الرئيسية في الطائف؟',
        en: 'What are the main tourist attractions in Taif?',
      ),

      relatedCity: Translation(ar: 'الطائف', en: 'Taif'),
      location: 'https://maps.app.goo.gl/nUapCejTsSMv88bU8',
    ),
  ];
}
