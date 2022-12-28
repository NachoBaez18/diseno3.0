import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideshowWidget extends StatelessWidget {
  final List<Widget> slides;

  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;
  const SlideshowWidget(
      {super.key,
      required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12,
      this.bulletSecundario = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(builder: (BuildContext context) {
          final ssModel = Provider.of<_SlideshowModel>(context);
          ssModel.colorPrimario = this.colorPrimario;
          ssModel.colorSecundario = this.colorSecundario;
          ssModel.bulletPrimario = this.bulletPrimario;
          ssModel.bulletSecundario = this.bulletSecundario;

          return _CrearStructuraSlideShow(
              puntosArriba: puntosArriba, slides: slides);
        })),
      ),
    );
  }
}

class _CrearStructuraSlideShow extends StatelessWidget {
  const _CrearStructuraSlideShow({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba) _Dots(slides.length),
        Expanded(child: _Slides(slides)),
        if (!puntosArriba) _Dots(slides.length)
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int cantidad;

  _Dots(this.cantidad);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(cantidad, (i) => _Dot(i)),
        // children: [
        //   _Dot(
        //     0,
        //   ),
        //   _Dot(
        //     1,
        //   ),
        //   _Dot(
        //     2,
        //   )
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    double tamano;
    Color color;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      tamano = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: tamano,
        height: tamano,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currenPage =
          pageViewController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        // children: [
        //   _Slide(
        //     svg: 'assets/svg/1.svg',
        //   ),
        //   _Slide(
        //     svg: 'assets/svg/2.svg',
        //   ),
        //   _Slide(
        //     svg: 'assets/svg/3.svg',
        //   ),
        // ],
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currenPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double bullet) {
    this._bulletPrimario = bullet;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double bullet) {
    this._bulletSecundario = bullet;
  }
}
