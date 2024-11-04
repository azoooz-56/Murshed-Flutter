class Translation {
  final String ar;
  final String en;

  Translation({required this.ar, required this.en});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      ar: json['ar'] as String,
      en: json['en'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ar': ar,
      'en': en,
    };
  }
}
