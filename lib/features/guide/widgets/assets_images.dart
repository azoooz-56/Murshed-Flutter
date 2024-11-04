

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetsImagesWidget extends StatelessWidget {
  final String image;

  const AssetsImagesWidget(
      this.image,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.asset(
           image,
          height: 110.h,
          width: 150.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
