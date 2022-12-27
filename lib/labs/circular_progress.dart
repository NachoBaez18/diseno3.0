import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgreesPage extends StatefulWidget {
  @override
  State<CircularProgreesPage> createState() => _CircularProgreesPageState();
}

class _CircularProgreesPageState extends State<CircularProgreesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double porcentaje = 0.0;
  double nuevoProcentaje = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      // print('valor controller: ${controller.value}');

      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoProcentaje, controller.value)!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          porcentaje = nuevoProcentaje;
          nuevoProcentaje += 10;
          if (nuevoProcentaje > 100) {
            nuevoProcentaje = 0;
            porcentaje = 0;
          }

          controller.forward(from: 0.0);
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(painter: _MiRadialProgreess(porcentaje)),
        ),
      ),
    );
  }
}

class _MiRadialProgreess extends CustomPainter {
  final porcentaje;

  _MiRadialProgreess(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {
    //todo: Circulo completado
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);

    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);
//todo: Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    //todo: Parte que se va ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
