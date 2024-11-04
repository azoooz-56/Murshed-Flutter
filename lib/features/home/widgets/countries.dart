part of '../screens/home_screen.dart';

class _Countries extends ConsumerWidget {
  const _Countries();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonSelected = ref.watch(isButtonGridSelected) != -1;
    final countriesState = ref.watch(isPlaceShownProvider) == null ? ref.watch(countriesController).getCountries() : ref.watch(countriesController).getPlaces(ref.watch(isPlaceShownProvider)?.id ?? "");
    return FadeInUp(
      child: StreamBuilder<List<Country>>(
          stream: countriesState,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final countries = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 40.w,
                  mainAxisSpacing: 30.w,
                  mainAxisExtent: context.heightR(.15),
                ),
                itemCount: countries.length,
                padding: EdgeInsets.only(
                    left: 30.w,
                    right: 30.w,
                    bottom: isButtonSelected ? 100.h : 20.h),
                itemBuilder: (context, index) {
                  final country = countries[index];
                  final isSelected = ref.watch(isButtonGridSelected) == index;
                  return GestureDetector(
                    onTap: () {
                      if(ref.watch(isPlaceShownProvider) == null){
                        ref.read(isButtonGridSelected.notifier).state = index;
                        ref.read(isPlaceShownProvider.notifier).state = country;

                      }else{
                        // context.push(
                        //   GuideScreen.routePath,
                        //   extra: country.toJson(),
                        // );
                        context.push(
                          QuestionScreen.routePath,
                          extra: country.toJson(),
                        );
                      }

                    },
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: isSelected
                          ? _Country(country: country)
                          : _DefaultCountry(country: country),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          }),
    );
  }
}

class _Country extends ConsumerWidget {
  final Country country;

  const _Country({
    required this.country,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(36.r),
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            child: CachedNetworkImage(
              imageUrl: country.image,
              fit: BoxFit.cover,
              height: context.height,
              width: context.width,
            ),
          ),
        ],
      ),
    );
  }
}

class _DefaultCountry extends StatelessWidget {
  final Country country;

  const _DefaultCountry({
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(36.r),
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            child: CustomPaint(
              foregroundPainter: FadingEffect(
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.01),
                  Color.fromRGBO(255, 255, 255, 0.01),
                  Color.fromRGBO(254, 250, 248, 0.66),
                  Color.fromRGBO(254, 250, 248, 1)
                ],
              ),
              child: CachedNetworkImage(
                imageUrl: country.image,
                fit: BoxFit.cover,
                height: context.height,
                width: context.width,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 2.0, right: 2.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                country.title.getValueByCurrentLanguage(context),
                style: context.appTextStyles.headlineSmall.copyWith(
                  height: 0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FadingEffect extends CustomPainter {
  final List<Color> colors;

  FadingEffect({
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    LinearGradient lg = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors,
    );
    Paint paint = Paint()..shader = lg.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(FadingEffect linePainter) => false;
}

final isButtonGridSelected = StateProvider.autoDispose((ref) => -1);
