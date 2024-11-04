import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed/features/home/data/services/country_service.dart';
import 'package:murshed/features/home/models/country.dart';

abstract class ICountryService {
  static final provider = Provider(
    (ref) => CountryService(FirebaseFirestore.instance),
  );

  Stream<List<Country>> getCountries();
}
