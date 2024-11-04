part of '../screens/guide_screen.dart';

class Images extends StatelessWidget {
  final String image;

  const Images(
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          imageUrl: image,
          height: 110.h,
          width: 150.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
