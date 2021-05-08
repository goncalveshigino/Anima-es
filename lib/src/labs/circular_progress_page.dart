import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {

  AnimationController controller;

  double percentagem = 0.0;
  double novaPercentagem = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

        controller.addListener(() {
            
          // print('Valor controller: ${controller.value}');
         setState(() {
            percentagem = lerpDouble(percentagem, novaPercentagem, controller.value);
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

          percentagem = novaPercentagem;

          novaPercentagem += 10;
          if (novaPercentagem > 100) {
            novaPercentagem = 0;
            percentagem = 0;
          }

          controller.forward( from: 0.0);

          setState(() {});
        },
      ),
      body: Center(

        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 200,
          height: 200,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(percentagem),
          ),
        ),

      ),

    );
  }
}

class _MiRadialProgress extends CustomPainter {
  _MiRadialProgress(this.percentagem);

  final percentagem;

  @override
  void paint(Canvas canvas, Size size) {
//Circulo completado

    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height  / 2);

    canvas.drawCircle(center, radius, paint);

    //Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // Parte que vai se regenerar
    double arcAngle = 2 * pi * (percentagem / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
       -pi / 2,
        arcAngle,
        false, 
        paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
