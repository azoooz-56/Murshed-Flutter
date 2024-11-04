import 'package:flutter/material.dart';
import 'package:murshed/core/themes/app_assets.dart';
import 'package:murshed/core/utilities/extensions.dart';

class Murshed extends StatelessWidget {
  final double? height;

  const Murshed({
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.murshed,
      height: height ?? context.heightR(.12),
    );
  }
}
