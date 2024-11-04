import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed/core/service/local/interface/i_simple_user_data.dart';
import 'package:murshed/core/utilities/enums.dart';

class OnBoardingProvider extends ChangeNotifier {
  static final provider = ChangeNotifierProvider(
    (ref) => OnBoardingProvider(
      ref.watch(
        ISimpleUserData.provider(LocalDataType.simple),
      ),
    ),
  );
  final ISimpleUserData cacheService;

  OnBoardingProvider(this.cacheService) {
    isFirstTime();
  }

  final _key = 'skipOnBoarding';

  Future<bool> isFirstTime() async {
    return await cacheService.readBool(_key) ?? true;
  }

  Future<void> skip() async {
    await cacheService.writeBool(_key, false);
  }
}
