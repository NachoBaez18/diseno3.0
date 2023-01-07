import 'package:disenosp2/theme/theme.dart';
import 'package:disenosp2/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlidesshowPage extends StatelessWidget {
  const SlidesshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge;

    final chiildren = [
      Expanded(child: MiSlideShow()),
      Expanded(child: MiSlideShow())
    ];

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }
    return Scaffold(
        //backgroundColor: Colors.purple,
        body: (isLarge)
            ? Column(
                children: chiildren,
              )
            : Row(
                children: chiildren,
              ));
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return SlideshowWidget(
      //puntosArriba: true,
      colorPrimario: (appTheme.darkTheme) ? accentColor : Color(0xffFF5A7E),
      bulletPrimario: 16,
      bulletSecundario: 12,
      //colorSecuandario: Colors.white,
      slides: [
        SvgPicture.asset('assets/svg/1.svg'),
        SvgPicture.asset('assets/svg/2.svg'),
        SvgPicture.asset('assets/svg/3.svg'),
        SvgPicture.asset('assets/svg/4.svg'),
        SvgPicture.asset('assets/svg/1.svg'),
        SvgPicture.asset('assets/svg/2.svg'),
        SvgPicture.asset('assets/svg/3.svg'),
        SvgPicture.asset('assets/svg/4.svg'),
      ],
    );
  }
}
