import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:aws_polly_api/polly-2016-06-10.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:murshed/core/components/custom_app_bar.dart';
import 'package:murshed/core/components/murshed.dart';
import 'package:murshed/core/components/widget_life_cycle_listener.dart';
import 'package:murshed/core/themes/app_assets.dart';
import 'package:murshed/core/utilities/extensions.dart';
import 'package:murshed/core/utilities/locale.dart';
import 'package:murshed/core/utilities/logic_helpers.dart';
import 'package:murshed/core/utilities/snackbar.dart';
import 'package:murshed/features/guide/controllers/actions_controller.dart';
import 'package:murshed/features/guide/controllers/chat_notifier.dart';
import 'package:murshed/features/guide/controllers/guide_controller.dart';
import 'package:murshed/features/guide/models/questions.dart';
import 'package:murshed/features/guide/widgets/assets_images.dart';
import 'package:murshed/features/home/models/country.dart';
import 'package:murshed/generated/locale_keys.g.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

part '../widgets/background.dart';

part '../widgets/options.dart';

part '../widgets/success_guide.dart';

part '../widgets/success_widget.dart';

part '../widgets/chat_bar.dart';

part '../widgets/welcome_guide.dart';

part '../widgets/waiting_guide.dart';

part '../widgets/images.dart';

part '../widgets/qr_code.dart';

part '../widgets/chat_list.dart';

part '../widgets/suggestions_list.dart';

class GuideScreen extends ConsumerWidget {
  final Country country;

  const GuideScreen({
    required this.country,
  });

  static const routePath = '/guide';

  static const routeName = 'GuideScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChatClicked = ref.watch(ActionsController.isChatClickedProvider);
    final isTalking = ref.watch(ActionsController.isTalkingProvider);
    final guideState = ref.watch(GuideNotifier.provider);
    final isLampClicked =
        ref.watch(ActionsController.isSuggestionClickedProvider);

    ref.listen(GuideNotifier.provider, (previous, next) {
      if(next.isFailed){
        CustomSnackBar.showError(context, "Error");

      }
    });

    return Scaffold(
      body: Stack(
        children: [
          _BackgroundScreen(image: country.image),
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  onRefresh: () {
                    ref.invalidate(GuideNotifier.provider);
                    ref.invalidate(ActionsController.isChatClickedProvider);
                    ref.invalidate(ActionsController.isTalkingProvider);
                    ref.invalidate(
                        ActionsController.isSuggestionClickedProvider);
                    ref.invalidate(ActionsController.isMicClickedProvider);
                    ref.read(ChatNotifier.provider.notifier).messages = [];
                  },
                  midWidget: Column(
                    children: [                Murshed(
                      height: context.heightR(.1),
                    ),
                      Text(
                        country.title.getValueByCurrentLanguage(context),
                        style: context.appTextStyles.displayLarge.copyWith(
                          height: 0,
                        ),
                      ),],
                  ),
                  color: Color(
                    0XFFA7946C,
                  ),
                  isShowLangButton: false,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      guideState.when(
                        initial: () => Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: _WelcomeGuide(),
                            ),
                          ],
                        ),
                        data: (messages) => Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: isTalking ?  _SuccessGuide() : _WelcomeGuide(),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: _SuccessWidget(
                                questions: messages,
                                country: country,
                              ),
                            ),
                          ],
                        ),
                        loading: () => Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: _WaitingGuide(),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: _WaitingGuide(),
                            ),
                          ],
                        ),
                        error: (message) {
                          return Text(message);
                        },
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 0,
                        right: 0,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: isLampClicked && guideState.isInitial
                              ? _SuggestionsList(LogicHelpers.getSuggestionList(
                                  country.title.ar),country )
                              : const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),

                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: isChatClicked ? _ChatBar(city:  country,) : _Options(city: country,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
