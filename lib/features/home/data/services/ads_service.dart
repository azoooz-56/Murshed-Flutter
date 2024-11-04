import 'package:murshed/features/home/data/interfaces/i_ads_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdsService extends IAdsService {
  final FirebaseFirestore _fireStore;

  AdsService(this._fireStore);

  @override
  Stream<List<String>> getAds() {
    final snapshots = _fireStore.collection('ads').snapshots();

    final Stream<List<String>> ads = snapshots.map(
          (snapshot) {
        final list =  snapshot.docs.map((doc) {
          final String images = doc['image'] ?? [];
          return images;
        }).toList();
        return list;
      },
    );
    return ads;
  }
}
