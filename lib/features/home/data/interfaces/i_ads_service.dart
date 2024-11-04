import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed/features/home/data/services/ads_service.dart';
import 'package:murshed/features/home/models/country.dart';

abstract class IAdsService {
  static final provider = Provider(
    (ref) => AdsService(FirebaseFirestore.instance),
  );

  Stream<List<String>> getAds();
}
