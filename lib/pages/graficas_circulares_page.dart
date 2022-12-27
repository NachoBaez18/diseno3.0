import 'dart:io';

import 'package:disenosp2/widgets/radial_progrees_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                porcentaje += 10;
                if (porcentaje > 100) {
                  porcentaje = 0;
                }
              });
            }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialPosgrees(
                  porcentaje: porcentaje,
                  color: Colors.blue,
                ),
                CustomRadialPosgrees(
                  porcentaje: porcentaje,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialPosgrees(
                  porcentaje: porcentaje,
                  color: Colors.green,
                ),
                CustomRadialPosgrees(
                  porcentaje: porcentaje,
                  color: Colors.pink,
                ),
              ],
            )
          ],
        ));
  }
}

class CustomRadialPosgrees extends StatelessWidget {
  final Color color;
  const CustomRadialPosgrees({
    Key? key,
    required this.porcentaje,
    required this.color,
  }) : super(key: key);

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: RadialProgreesWidget(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: Colors.grey,
        grosorSecundario: 8,
        grosorPrimario: 7,
      ),
    );
  }
}
