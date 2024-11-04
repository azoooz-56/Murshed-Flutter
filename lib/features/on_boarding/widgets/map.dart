part of '../screens/on_boarding_screen.dart';

class _Map extends ConsumerWidget {
  const _Map();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnimationClicked = ref.watch(isClicked);
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: isAnimationClicked ? 1 : 0.6,
      child: Image.asset(
        AppAssets.map,
        height: context.heightR(0.5),
      ),
    );
  }
}
