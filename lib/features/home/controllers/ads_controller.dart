import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed/features/home/data/interfaces/i_ads_service.dart';

final adsController = Provider(
  (ref) => ref.watch(IAdsService.provider),
);
