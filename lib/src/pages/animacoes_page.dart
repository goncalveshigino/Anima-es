import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QuadradoAnimado(),
      ),
    );
  }
}

class QuadradoAnimado extends StatefulWidget {
  @override
  _QuadradoAnimadoState createState() => _QuadradoAnimadoState();
}

class _QuadradoAnimadoState extends State<QuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotacao;

  Animation<double> opacidade;
  Animation<double> opacidadeOut;

  Animation<double> moverDireita;
  Animation<double> alargar;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotacao = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacidade = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut)));

    opacidadeOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    moverDireita = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    alargar = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.addListener(() {
      // print('Status: ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        //controller.reverse();
        controller.reset();
      }
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
    //Play
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        return Transform.translate(
          offset: Offset(moverDireita.value, 0),
          child: Transform.rotate(
              angle: rotacao.value,
              child: Opacity(
                opacity: opacidade.value - opacidadeOut.value,
                child: Transform.scale(
                    scale: alargar.value, child: childRectangulo),
              )),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
