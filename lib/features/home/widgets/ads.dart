part of '../screens/home_screen.dart';

class _Ads extends ConsumerWidget {
  const _Ads();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adsState = ref.watch(adsController).getAds();
    return StreamBuilder(
      stream: adsState,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final ads = snapshot.data!.toList();
          return _AdsCards(ads: ads);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _AdsCards extends ConsumerWidget {
  final List<String> ads;

  _AdsCards({
    required this.ads,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(_currentIndexProvider);
    return Column(
      children: [
        CarouselSlider(
          items: ads.map(
            (e) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    22.r,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: e.toString(),
                    height: context.height,
                    width: context.width,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ).toList(),
          options: CarouselOptions(
              clipBehavior: Clip.none,
              height: 200.h,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, __) {
                ref.read(_currentIndexProvider.notifier).state = index;
              }),
        ),
        10.verticalSpace,
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: ads.length,
          effect: ColorTransitionEffect(
            activeDotColor: context.appTheme.entryScreenButtons,
            dotColor: Color(0xffD9D9D9),
            dotHeight: 10.h,
            dotWidth: 9.w,
          ),
        ),
      ],
    );
  }

  final _currentIndexProvider = StateProvider.autoDispose((ref) => -1);
}
