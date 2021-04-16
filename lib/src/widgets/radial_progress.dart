import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  const RadialProgress(
      {@required this.percentagem,
      this.primaryColor = Colors.blue,
      this.secundsColor = Colors.orange,
      this.grosorSecund = 4});

  final percentagem;
  final Color primaryColor;
  final Color secundsColor;
  final double grosorSecund;

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double antigaPecentagem;

  @override
  void initState() {
    antigaPecentagem = widget.percentagem;

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.percentagem - antigaPecentagem;
    antigaPecentagem = widget.percentagem;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
                (widget.percentagem - diferenciaAnimar) +
                    (diferenciaAnimar * controller.value),
                widget.primaryColor,
                widget.secundsColor,
                widget.grosorSecund),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  _MiRadialProgress(this.percentagem, this.primaryColor, this.secundsColor,
      this.grosorSecund);

  final percentagem;
  final Color primaryColor;
  final Color secundsColor;
  final double grosorSecund;

  @override
  void paint(Canvas canvas, Size size) {
//Circulo completado

    final paint = new Paint()
      ..strokeWidth = grosorSecund
      ..color = secundsColor
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    //Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = primaryColor
      ..style = PaintingStyle.stroke;

    // Parte que vai se regenerar
    double arcAngle = 2 * pi * (percentagem / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
