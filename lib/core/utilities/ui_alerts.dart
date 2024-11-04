import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:murshed/core/utilities/extensions.dart';


mixin UiAlerts {
  static void logoutDialog(
    BuildContext context, {
    required void Function()? onClick,
    required String title,
    required String content,
    required String onClickTitle,
  }) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
          ),
          content: Text(
            content,
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                "",
                style: context.appTextStyles.bodyMedium.copyWith(
                  color: context.appTheme.black,
                ),
              ),
            ),
            TextButton(
              onPressed: onClick,
              child: Text(
                onClickTitle,
                style: context.appTextStyles.bodyMedium.copyWith(
                  color: context.appTheme.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
