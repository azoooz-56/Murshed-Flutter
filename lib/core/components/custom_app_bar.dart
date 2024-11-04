import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:murshed/core/themes/app_assets.dart';
import 'package:murshed/core/utilities/extensions.dart';
import 'package:murshed/features/settings/screens/language_selection_screen.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onRefresh;
  final Color? color;
  final bool isShowLangButton;
  final Widget? midWidget;

  const CustomAppBar({
    this.onRefresh,
    this.color,
    this.midWidget,
    this.isShowLangButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isShowLangButton ?_LanguageButton(
            color: color,
          ) : IconButton(iconSize: 30,onPressed: ()=> context.pop(), icon: BackButton()),
          if (midWidget != null) midWidget!,
          if (onRefresh != null)
            _RefreshButton(
              onRefresh: onRefresh!,
              color: this.color,
            )
          else
            const SizedBox(),

        ],
      ),
    );
  }
}

class _RefreshButton extends StatelessWidget {
  final VoidCallback onRefresh;
  final Color? color;

  const _RefreshButton({
    required this.onRefresh,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRefresh,
      child: SvgPicture.asset(
        AppAssets.refresh,
        color: color ?? context.appTheme.black,
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final Color? color;

  const _LanguageButton({
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(LanguageSelectionScreen.routePath);
      },
      child: SvgPicture.asset(
        AppAssets.arabicIcon,
        color: color ?? context.appTheme.black,
      ),
    );
  }
}
