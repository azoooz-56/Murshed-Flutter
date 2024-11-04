
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:murshed/features/home/models/country.dart';




class VectaraServices{

  static Future<Answers?> searchQueryVectara(String query, String langCode, Country country) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-api-key': 'zut_tLig6S_J-3kaG-zJfBGXr260_O-busH2iGVH-Q'
    };
    Logger().w(query);
    Logger().w(country.corporaId);
    var data = json.encode({



        // "query": [
        //   {
        //     "query": "What is the answer to the life, the universe, and everything?",
        //     "start": 0,
        //     "numResults": 10,
        //     "contextConfig": {
        //       "sentencesBefore": 3,
        //       "sentencesAfter": 3,
        //       "startTag": "<b>",
        //       "endTag": "</b>"
        //     },
        //     "corpusKey": [
        //       {
        //         "customerId": 3031998697,
        //         "corpusId": country.corporaId
        //       }
        //     ],
        //     "summary": [
        //       {
        //         "maxSummarizedResults": 10,
        //         "responseLang": "en"
        //       }
        //     ]
        //   }
        // ]



      "query": [
        {
          "query": """
          $query,

           the response must be like this json format, it must be correct json:

          {
            "answer": ''//murshed answer, it must be short,
            "images": [] ?? null //images, for answer, if no images right null

            ],
            "location": '' // location url, it must be one can't be more that one
            "video": '' // location url, it must be one can't be more that one

          }
          
          please don't use the numbers on the message

          """,
          "queryContext": "",
          "start": 0,
          "numResults": 10,
          "contextConfig": {
            "charsBefore": 0,
            "charsAfter": 0,
            "sentencesBefore": 2,
            "sentencesAfter": 2,
            "startTag": "%START_SNIPPET%",
            "endTag": "%END_SNIPPET%"
          },
          "corpusKey": [
            {
              "customerId": 3031998697,
              "corpusId": country.corporaId,
              "semantics": 0,
              "metadataFilter": "",
              "lexicalInterpolationConfig": {
                "lambda": 0.025
              },
              "dim": []
            }
          ],
          "summary": [
            {
              "debug": false,
              "chat": {
                "store": true,
                "conversationId": ""
              },
              "maxSummarizedResults": 5,
              "responseLang": "ara",
              "summarizerPromptName": "vectara-summary-ext-v1.2.0",
              "factualConsistencyScore": true
            }
          ]
        }
      ]
    });
    var dio = Dio();
    try {
      var response = await dio.post(
        'https://api.vectara.io/v1/query',
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Logger().w(response.data);
        Logger().w(response.data['responseSet'].first['summary'].first['text']);
        try {
          Answers answers = Answers.fromJson(json.decode(response.data['responseSet'].first['summary'].first['text']));
          Logger().w(answers.answer);
          return answers;
        } catch (e) {
          throw Exception('Failed to parse response data: $e');
        }
      } else {
        Logger().w(response);
        throw Exception('Failed to fetch data: ${response.statusMessage}');
      }
    } catch (e) {
      Logger().w(e.toString());
      throw Exception('Request failed: $e');
    }
  }

  static Future<Answers?> searchSimpleQueryVectara(String query, String city, String langCode) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-api-key': 'zut_tLig6S_J-3kaG-zJfBGXr260_O-busH2iGVH-Q'
    };
    var data = json.encode({
      "query": [
        {
          "query": """
          $query,
                
      // عليك الاجابة فقط على البيانات المتوفرة لديك، اذا كان السوال لا توجد معلوماته، الرجاء الاجابة : لا يوجد بيانات متوفرة
      the response must be like this json format, it must be correct json: the Answer language must be on $langCode   
      please provide the urls، please the answer it must be short
      
         { 
          "answer": '' //murshed answer, it must be short, and short
          "images_urls": [] ?? null, add images if there on the data
          "location_urls": '' add location if there on the data
          "video_urls": ''   add video if there on the data
        }
          
          """
        }
      ]
    });
    var dio = Dio();
    try {
      var response = await dio.request(
        'https://api.vectara.io/v2/corpora/${city}_key/query?query=$query',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Logger().w(response.data);
        Logger().w(response.data['search_results'].first['text']);
        try {
          Answers answers = Answers.fromJson(json.decode(response.data['search_results'].first['text']));
          Logger().w(answers.answer);
          return answers;
        } catch (e) {
          throw Exception('Failed to parse response data: $e');
        }
      } else {
        Logger().w(response);
        throw Exception('Failed to fetch data: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }



// static Future<Answers?> searchQueryVectara(String query, String langCode) async {
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'x-api-key': 'zut_tLig6S_J-3kaG-zJfBGXr260_O-busH2iGVH-Q'
  //   };
  //   var data = json.encode({
  //     "query": """ ,
  //
  //             the response must be like this json format, it must be correct json: the Answer language must be on $langCode
  //       {
  //         "answer": ''//murshed answer, it must be short,
  //         "images": [] ?? null //images, for answer, if no images right null
  //         ],
  //         "location": '' // location url, it must be one can't be more that one
  //         "video": '' // video url, it must be one can't be more that one
  //       }
  //
  //     """,
  //     "corpusKey": [
  //       {
  //         "customerId": 3031998697,
  //         "corpusId": 4,
  //         "semantics": 0,
  //         "metadataFilter": "",
  //         "lexicalInterpolationConfig": {
  //           "lambda": 0.99
  //         },
  //         "dim": []
  //       }
  //     ],
  //     "search": {
  //       "corpora": [
  //         {
  //           "corpus_key": "Murshed_4",
  //           "metadata_filter": "",
  //           "lexical_interpolation": 0,
  //           "custom_dimensions": {}
  //         }
  //       ],
  //       "offset": 0,
  //       "limit": 10,
  //       "context_configuration": {
  //         "start_tag": "%START_SNIPPET%",
  //         "end_tag": "%END_SNIPPET%"
  //       }
  //     },
  //     "stream_response": true,
  //     "generation": {
  //       "prompt_name": "vectara-summary-ext-v1.2.0",
  //       "max_used_search_results": 1,
  //       "prompt_text": "",
  //       "response_language": "ara",
  //       "enable_factual_consistency_score": true
  //     }
  //   });
  //   var dio = Dio();
  //   try {
  //     var response = await dio.request(
  //       'https://api.vectara.io/v2/query',
  //       options: Options(
  //         method: 'POST',
  //         headers: headers,
  //       ),
  //       data: data,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       List resList = (response.data);
  //       Logger().w(resList);
  //       Logger().w(resList.first["search_results"]["text"]);
  //       try {
  //         Answers answers = Answers.fromJson(json.decode(resList.first["search_results"]["text"]));
  //         Logger().w(answers.answer);
  //         return answers;
  //       } catch (e) {
  //         throw Exception('Failed to parse response data: $e');
  //       }
  //     } else {
  //       throw Exception('Failed to fetch data: ${response.statusMessage}');
  //     }
  //   } catch (e) {
  //     throw Exception('Request failed: $e');
  //   }
  // }


}


class Answers {
  final String? answer;
  final List<String>? images;
  final String? location;
  final String? video;

  Answers({required this.answer, required this.images, required this.location, required this.video});

  factory Answers.fromJson(Map<String, dynamic> json) {
    return Answers(
      answer: json['answer'],
      images: json['images_urls'] == null ? null :  List<String>.from(json['images_urls']),
      location: json['location_urls'],
      video: json['video_urls'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'images_urls': answer,
      'images': images,
      'location_urls': location,
      'video_urls': video,
    };
  }
}
