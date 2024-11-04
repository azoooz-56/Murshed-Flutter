import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed/app.dart';
import 'package:murshed/core/utilities/locale.dart';
import 'package:murshed/generated/codegen_loader.g.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.instance.requestPermission();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: AppLocale.locales,
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        startLocale: AppLocale.arabic,
        fallbackLocale: AppLocale.english,
        useOnlyLangCode: true,
        child: const MyApp(),
      ),
    ),
  );
}
