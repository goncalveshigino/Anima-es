import 'package:flutter/material.dart';

class QuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: _QuadradoAnimado()
      ),
    );
  }
}

class _QuadradoAnimado extends StatefulWidget {

  @override
  _QuadradoAnimadoState createState() => _QuadradoAnimadoState();
}

class _QuadradoAnimadoState extends State<_QuadradoAnimado> 
with SingleTickerProviderStateMixin{

  AnimationController controller;
  // animacoes
  Animation<double> moverDireita;
  Animation<double> moverCima;
  Animation<double> moverEsquerda;
  Animation<double> moverBaixo;
  
  @override
  void initState() {
    super.initState();
    // inicializar todo
    controller = new AnimationController(
       vsync: this, duration: Duration(milliseconds: 4500)
    );


   moverDireita = Tween(begin: 0.0, end: 100.0 ).animate(
      CurvedAnimation( parent: controller, curve: Interval(0.0,  0.25, curve: Curves.bounceOut))
   );

   moverCima = Tween(begin: 0.0, end: -100.0 ).animate(
      CurvedAnimation( parent: controller, curve: Interval(0.25,  0.5, curve: Curves.bounceOut))
   );

     moverCima = Tween(begin: 0.0, end: -100.0 ).animate(
      CurvedAnimation( parent: controller, curve: Interval(0.25,  0.5, curve: Curves.bounceOut))
   );

   moverEsquerda = Tween(begin: 0.0, end: -100.0).animate(
     CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.bounceOut))
   );

     moverBaixo = Tween(begin: 0.0, end: 100.0).animate(
     CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.bounceOut))
   );

   controller.addListener(() {
     if( controller.status == AnimationStatus.completed){
       controller.reset();
     }
   });
  
  }

  @override
  void dispose() {

   controller.dispose();
    super.dispose(); 
  }
  @override
  Widget build(BuildContext context) {

      controller.forward();

    return AnimatedBuilder(
       animation: controller,
       child: _Rectangulo(),
       builder: (BuildContext context, Widget child){
         return Transform.translate(
             offset: Offset(moverDireita.value + moverEsquerda.value, moverCima.value + moverBaixo.value),
             child: child,
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
    decoration: BoxDecoration(
    color: Colors.blue
  ),
  );
  }
}