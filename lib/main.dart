//import 'package:disenosp2/pages/headers_page.dart';
//import 'package:disenosp2/labs/circular_progress.dart';
//import 'package:disenosp2/pages/graficas_circulares_page.dart';
//import 'package:disenosp2/labs/slideShow_page.dart';
import 'package:disenosp2/pages/slideShow_page.dart';
//import 'package:disenosp2/retos/cuadrado_animado_pages.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: SlidesshowPage(),
    );
  }
}
