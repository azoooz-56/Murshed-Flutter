import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:murshed/core/components/custom_button.dart';
import 'package:murshed/core/components/murshed.dart';
import 'package:murshed/core/themes/app_assets.dart';
import 'package:murshed/core/utilities/extensions.dart';
import 'package:murshed/features/guide/screens/guide_screen.dart';
import 'package:murshed/features/home/controllers/ads_controller.dart';
import 'package:murshed/features/home/controllers/countries_controller.dart';
import 'package:murshed/features/home/models/country.dart';
import 'package:murshed/features/questions/screens/question_screen.dart';
import 'package:murshed/features/settings/screens/language_selection_screen.dart';
import 'package:murshed/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part '../widgets/countries.dart';

part '../widgets/ads.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const routePath = '/home';

  static const routeName = 'Home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonSelected = ref.watch(isButtonGridSelected) != -1;
    final countriesState = ref.watch(countriesController).getCountries();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.appTheme.secondaryBackground,
        centerTitle: true,
        title: Murshed(
          height: context.heightR(.07),
        ),
        leading: ref.watch(isPlaceShownProvider) == null ? null :  IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined), onPressed: () {
          ref.watch(isPlaceShownProvider.notifier).state = null;
        },),
        actions: [
          _LanguageButton(),
          20.horizontalSpace,
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            40.verticalSpace,
            _Ads(),
            40.verticalSpace,
            Text(
              LocaleKeys.home_selectLanguage.tr(),
              style: context.textTheme.displaySmall!
                  .copyWith(fontSize: 32.spMin, height: 0),
              textAlign: TextAlign.center,
            ),
            10.verticalSpace,
            Expanded(
              child: Stack(
                children: [
                  _Countries(),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: isButtonSelected ? 1 : 0,
                      child: CustomPaint(
                        foregroundPainter: FadingEffect(
                          colors: [
                            Color.fromRGBO(254, 252, 252, 0.27),
                            Color.fromRGBO(254, 252, 252, 1),
                            Color.fromRGBO(254, 252, 252, 1),
                            Color.fromRGBO(254, 252, 252, 1),
                          ],
                        ),
                        child: SizedBox(
                          height: 100.h,
                          width: context.width,
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  //   child: StreamBuilder<List<Country>>(
                  //     stream: countriesState,
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         final index = isButtonSelected
                  //             ? ref.watch(isButtonGridSelected)
                  //             : 0;
                  //         final country = snapshot.data![index];
                  //         return CustomPaint(
                  //           child: Column(
                  //             children: [
                  //               AnimatedOpacity(
                  //                 duration: Duration(milliseconds: 500),
                  //                 opacity: isButtonSelected ? 1 : 0,
                  //                 child: CustomButton(
                  //                   title:
                  //                       LocaleKeys.languageSelection_next.tr(),
                  //                   onClick: () {
                  //                     context.push(
                  //                       GuideScreen.routePath,
                  //                       extra: country.toJson(),
                  //                     );
                  //                   },
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       } else {
                  //         return const SizedBox();
                  //       }
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  const _LanguageButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(LanguageSelectionScreen.routePath);
      },
      child: SvgPicture.asset(
        AppAssets.arabicIcon,
        color: context.appTheme.black,
      ),
    );
  }
}

final isPlaceShownProvider = StateProvider.autoDispose<Country?>((ref) => null);
