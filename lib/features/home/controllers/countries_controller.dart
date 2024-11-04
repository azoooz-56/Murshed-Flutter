import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed/features/home/data/interfaces/i_country_services.dart';

final countriesController = Provider(
  (ref) => ref.watch(ICountryService.provider),
);
