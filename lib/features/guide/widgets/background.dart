part of '../screens/guide_screen.dart';

class _BackgroundScreen extends StatelessWidget {
  final String image;

  const _BackgroundScreen({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .15,
      child: CachedNetworkImage(
        imageUrl: image,
        height: context.height,
        width: context.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
