import 'package:murshed/features/home/models/translation.dart';

class Country {
  final Translation title;
  final Translation? description;
  final String image;
  final int? corporaId;
  final String? id;
  final String? cityId;

  Country({
    required this.title,
    required this.description,
    required this.image,
    required this.id,
    required this.corporaId,
    required this.cityId,
  });

  factory Country.fromJson(Map<String, dynamic> json, String? id, ) {
    print(json);
    return Country(
      title: Translation.fromJson(json['title']),
      description: json.containsKey('description') ? json['description'] == null ? null : Translation.fromJson(json['description']) : null,
      image: json['image'] as String,
      id: id,
      corporaId: json['corporaId'],
      cityId: json['cityId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title.toJson(),
      'description': description?.toJson(),
      'image': image,
      'corporaId': corporaId,
      'id': id,
      'cityId': cityId,
    };
  }

  // static int _rgbaToInt(int r, int g, int b, double a) {
  //   r = r.clamp(0, 255);
  //   g = g.clamp(0, 255);
  //   b = b.clamp(0, 255);
  //   a = a.clamp(0.0, 1.0);
  //
  //   int colorInt = ((a * 255).toInt() << 24) | (r << 16) | (g << 8) | b;
  //
  //   return colorInt;
  // }

  // static List<Country> getCountries() {
  //   return [
  //     Country(
  //         title: LocaleKeys.home_country1.tr(),
  //         image: AppAssets.country1,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(170, 154, 141, 0.79),
  //           _rgbaToInt(123, 109, 98, .8),
  //           _rgbaToInt(123, 109, 98, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country2.tr(),
  //         image: AppAssets.country2,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(235, 220, 189, 0.5),
  //           _rgbaToInt(206, 187, 145, .84),
  //           _rgbaToInt(206, 187, 145, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country3.tr(),
  //         image: AppAssets.country3,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(209, 189, 178, 0.61),
  //           _rgbaToInt(211, 181, 170, .76),
  //           _rgbaToInt(211, 181, 170, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country4.tr(),
  //         image: AppAssets.country4,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(177, 189, 179, 0.58),
  //           _rgbaToInt(147, 164, 146, 1),
  //           _rgbaToInt(147, 164, 146, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country5.tr(),
  //         image: AppAssets.country5,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(149, 131, 127, 0.83),
  //           _rgbaToInt(92, 64, 50, 0.74),
  //           _rgbaToInt(92, 64, 50, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country6.tr(),
  //         image: AppAssets.country6,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(239, 230, 225, 0.78),
  //           _rgbaToInt(138, 127, 121, .9),
  //           _rgbaToInt(138, 127, 121, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country7.tr(),
  //         image: AppAssets.country7,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(217, 213, 214, 0.82),
  //           _rgbaToInt(144, 142, 143, .95),
  //           _rgbaToInt(144, 142, 143, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country8.tr(),
  //         image: AppAssets.country8,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(170, 153, 145, 0.79),
  //           _rgbaToInt(170, 153, 145, 0.79),
  //           _rgbaToInt(167, 108, 107, 1),
  //           _rgbaToInt(167, 108, 107, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country9.tr(),
  //         image: AppAssets.country9,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.1),
  //           _rgbaToInt(255, 255, 255, 0.1),
  //           _rgbaToInt(255, 255, 255, 0.1),
  //           _rgbaToInt(159, 79, 70, 0.85),
  //           _rgbaToInt(159, 79, 70, 0.85),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country10.tr(),
  //         image: AppAssets.country10,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.1),
  //           _rgbaToInt(255, 255, 255, 0.1),
  //           _rgbaToInt(255, 255, 255, 0.1),
  //           _rgbaToInt(223, 220, 203, 1),
  //           _rgbaToInt(130, 127, 112, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country11.tr(),
  //         image: AppAssets.country11,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.1),
  //           _rgbaToInt(255, 255, 255, 0.1),
  //           _rgbaToInt(167, 191, 215, 0.69),
  //           _rgbaToInt(73, 94, 131, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country12.tr(),
  //         image: AppAssets.country12,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(255, 255, 255, 0.01),
  //           _rgbaToInt(177, 170, 151, 0.61),
  //           _rgbaToInt(177, 170, 151, 0.61),
  //           _rgbaToInt(152, 141, 92, 1),
  //           _rgbaToInt(152, 141, 92, 1),
  //         ]),
  //     Country(
  //         title: LocaleKeys.home_country13.tr(),
  //         image: AppAssets.country13,
  //         colors: [
  //           _rgbaToInt(255, 255, 255, 0),
  //           _rgbaToInt(255, 255, 255, 0),
  //           _rgbaToInt(255, 255, 255, 0),
  //           _rgbaToInt(197, 201, 200, 0.69),
  //           _rgbaToInt(108, 113, 106, 1),
  //         ]),
  //   ];
  // }

  @override
  String toString() {
    return 'Country{title: $title, image: $image,}';
  }
}
