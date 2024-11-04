part of '../screens/guide_screen.dart';

class _QrCode extends StatelessWidget {
  final String data;

  const _QrCode({
    this.data = '',
  });

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: data,
      size: 150.h,
    );
  }
}
