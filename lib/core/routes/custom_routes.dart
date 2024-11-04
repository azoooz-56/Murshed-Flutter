import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:murshed/core/routes/animation/fade_animation_page.dart';
import 'package:murshed/core/routes/route_observer.dart';
import 'package:murshed/features/guide/screens/guide_screen.dart';
import 'package:murshed/features/home/models/country.dart';
import 'package:murshed/features/home/screens/home_screen.dart';
import 'package:murshed/features/on_boarding/providers/on_boarding_provider.dart';
import 'package:murshed/features/on_boarding/screens/splash_screen.dart';
import 'package:murshed/features/questions/screens/question_screen.dart';
import 'package:murshed/features/settings/screens/language_selection_screen.dart';
import 'package:murshed/features/on_boarding/screens/on_boarding_screen.dart';

mixin AppRouter {
  static final observerProvider = Provider((ref) {
    return AppRouteObserver();
  });
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final provider = Provider(
    (ref) {
      final observer = ref.watch(observerProvider);
      return GoRouter(
        initialLocation: SplashScreen.routePath,
        observers: [observer],
        navigatorKey: navigatorKey,
        routes: [
          GoRoute(
            path: SplashScreen.routePath,
            name: SplashScreen.routeName,
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: SplashScreen(),
              );
            },
          ),
          GoRoute(
            path: OnBoardingScreen.routePath,
            name: OnBoardingScreen.routeName,
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: OnBoardingScreen(),
              );
            },
            redirect: (context, state) async {
              final isFirstTime =
                  await ref.watch(OnBoardingProvider.provider).isFirstTime();
              if (!isFirstTime) {
                return HomeScreen.routePath;
              }
              return null;
            },
          ),
          GoRoute(
            path: LanguageSelectionScreen.routePath,
            name: LanguageSelectionScreen.routeName,
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: LanguageSelectionScreen(),
              );
            },
          ),
          GoRoute(
            path: HomeScreen.routePath,
            name: HomeScreen.routeName,
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: HomeScreen(),
              );
            },
          ),
          GoRoute(
            path: GuideScreen.routePath,
            name: GuideScreen.routeName,
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: GuideScreen(
                  country: Country.fromJson(
                    state.extra as Map<String, dynamic>,
                    null
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: QuestionScreen.routePath,
            name: QuestionScreen.routeName,
            pageBuilder: (context, state) {
              final mapp = state.extra as Map<String, dynamic>;
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: QuestionScreen(
                  country: Country.fromJson(
                      state.extra as Map<String, dynamic>,
                      mapp['id']
                  ),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
