import 'package:murshed/features/home/data/interfaces/i_country_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:murshed/features/home/models/country.dart';

class CountryService extends ICountryService {
  final FirebaseFirestore _fireStore;

  CountryService(this._fireStore);

  @override
  Stream<List<Country>> getCountries() {
    final snapshots = _fireStore.collection('countries').snapshots();

    final Stream<List<Country>> countries = snapshots.map(
      (snapshot) =>
          snapshot.docs.map((doc) => Country.fromJson(doc.data(), doc.id)).toList(),
    );
    return countries;
  }

  Stream<List<Country>> getPlaces(String cityId) {
    final snapshots = _fireStore
        .collection('places')
        .where('cityId', isEqualTo: cityId) // Filter by cityId
        .snapshots();

    final Stream<List<Country>> countries = snapshots.map(
          (snapshot) =>
          snapshot.docs.map((doc) => Country.fromJson(doc.data(), doc.id)).toList(),
    );

    return countries;
  }


}
