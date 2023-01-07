import 'package:disenosp2/pages/animaciones_page.dart';
import 'package:disenosp2/pages/emergency_page.dart';
import 'package:disenosp2/pages/graficas_circulares_page.dart';
import 'package:disenosp2/pages/headers_page.dart';
import 'package:disenosp2/pages/pinteres_page.dart';
import 'package:disenosp2/pages/slideShow_page.dart';
import 'package:disenosp2/pages/slider_list_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlidesshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeaderPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro Animado', CuadradoAnimado()),
  _Route(
      FontAwesomeIcons.circleNotch, 'Barra Progreso', GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinteres', PinteresPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliderPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
