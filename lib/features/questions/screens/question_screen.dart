import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:murshed/core/utilities/extensions.dart';
import 'package:murshed/features/guide/data/services/vectara_services.dart';
import 'package:murshed/features/home/models/country.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/themes/app_assets.dart';
import '../../guide/screens/guide_screen.dart';
import '../../guide/widgets/assets_images.dart';
import '../../home/screens/home_screen.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key, required this.country});
  final Country country;

  static const routePath = '/question';

  static const routeName = 'QuestionScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(country.description?.ar ?? "non");
    print(country.title.ar ?? "non");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent
        ,onPressed: (){
          final city = ref.watch(isPlaceShownProvider);
        context.push(
          GuideScreen.routePath,
          extra: city?.toJson(),
        );
      },child: Image.asset('assets/images/Intersect.png', width: 83,),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0), // Adjust the radius as needed
                  bottomRight: Radius.circular(40.0),
                ),
                child: Image.network(
                  country.image,
                  width: double.infinity,
                  height: 378,
                  fit: BoxFit.cover,
                ),
              ),
              PositionedDirectional(
                top: 20,
                start: 10,
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.4)),
                  child: BackButton(onPressed: () => context.pop(), color: Colors.black),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country.title.getValueByCurrentLanguage(context),
                    style: context.textTheme.displaySmall?.copyWith(fontSize: 32),
                  ),
                  Text(
                    country.description?.getValueByCurrentLanguage(context) ?? "",
                    style: context.textTheme.displaySmall?.copyWith(fontSize: 19),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ref.watch(fetchPlacesDataProvider(country.id ?? "")).when(
                      data: (data) {
                        Logger().w(data.length);
                        return Expanded(
                            child: QuestionList(
                              data: data,
                            ));
                      },
                      error: (error, st) {
                        return Text(error.toString());
                      },
                      loading: () => CircularProgressIndicator())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class QuestionList extends StatefulWidget {
  final List<Data> data;
  QuestionList({required this.data});
  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        Logger().w(widget.data[index].imageUrl);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: QuestionTile(question: widget.data[index]),
        );
      },
    );
  }
}

class QuestionTile extends StatefulWidget {
  final Data question;

  const QuestionTile({Key? key, required this.question}) : super(key: key);

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  @override
  Widget build(BuildContext context) {
    Logger().w(widget.question.imageUrl);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ExpansionTile(
        title: Text(widget.question.question ?? "", textDirection: TextDirection.rtl),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(widget.question.answer ?? "", textDirection: TextDirection.rtl),
                Wrap(
                  alignment: WrapAlignment.center,

                  children: [
                    if (widget.question.locationUrl != null && !(widget.question.locationUrl?.isEmpty ?? true))
                      GestureDetector(onTap: (){
                        _launchUrl(widget.question.locationUrl ?? "");
                      } ,child: AssetsImagesWidget(AppAssets.mapLocation)),
                    if (widget.question.imageUrl != null && !(widget.question.imageUrl?.isEmpty ?? true))
                      Images(widget.question.imageUrl ?? ""),
                    if (widget.question.videoUrl != null && !(widget.question.videoUrl?.isEmpty ?? true))
                      GestureDetector(
                        onTap: ()=> _launchUrl(widget.question.videoUrl ?? ""),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: AssetsImagesWidget(AppAssets.videoImage ?? ""),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final fetchPlacesDataProvider = FutureProvider.family.autoDispose<List<Data>, String>((ref, placeId) async {
  Logger().w(placeId);
  final result = await getDataPlaces(placeId);
  return result;
});

Future<List<Data>> getDataPlaces(String placeId) async {
  final CollectionReference _dataCollection = FirebaseFirestore.instance.collection('data');
  Logger().w(placeId);
  try {
    QuerySnapshot querySnapshot = await _dataCollection.where('placeId', isEqualTo: placeId).get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    return documents.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Data.fromJson(data, doc.id);
    }).toList();
  } catch (e) {
    Logger().w('Error fetching documents: $e');
    return [];
  }
}

class Data {
  final String? id;
  final String? question;
  final String? answer;
  final String? cityNameEn;
  final int? courpeId;
  final String? imageUrl;
  final String? videoUrl;
  final String? locationUrl;
  final String? placeId;

  Data({
    this.id,
    required this.question,
    required this.answer,
    this.cityNameEn,
    this.courpeId,
    this.imageUrl,
    this.videoUrl,
    this.locationUrl,
    this.placeId,
  });

  // Convert a Data into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'locationUrl': locationUrl,
      'cityNameEn': cityNameEn,
      'courpeId': courpeId,
      'placeId': placeId,
    };
  }

  // Implement toString to make it easier to see information about each data when using the print statement.
  @override
  String toString() {
    return 'Place_data{question: $question, answer: $answer, imageUrl: $imageUrl, videoUrl: $videoUrl, locationUrl: $locationUrl}';
  }

  // Create a Data from JSON data
  factory Data.fromJson(Map<String, dynamic> json, String id) {
    return Data(
      id: id,
      question: json['question'],
      answer: json['answer'],
      imageUrl: json['imageUrl'],
      videoUrl: json['videoUrl'],
      locationUrl: json['locationUrl'],
      courpeId: json['corporaId'],
      cityNameEn: json['cityNameEn'],
      placeId: json['placeId'],
    );
  }

  // Convert a Data to JSON data
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'locationUrl': locationUrl,
      'cityNameEn': cityNameEn,
      'corporaId': courpeId,
      'placeId': placeId,
    };
  }
}

Future<void> _launchUrl(String url) async {
  Logger().w(url);
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
    );
  } else {
    throw 'Could not launch $url';
  }
}