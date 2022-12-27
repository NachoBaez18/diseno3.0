import 'package:disenosp2/pages/animaciones_page.dart';
//import 'package:disenosp2/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimacionesPage(),
    );
  }
}
