import 'package:disenosp2/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidesshowPage extends StatelessWidget {
  const SlidesshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.purple,
        body: Column(
      children: [
        Expanded(child: MiSlideShow()),
        Expanded(child: MiSlideShow())
      ],
    ));
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideshowWidget(
      //puntosArriba: true,
      colorPrimario: Colors.purple,
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
