import 'package:flutter/material.dart';

class HeaderQuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordersRedondas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          )),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: HeaderDiagonalPainter(),
      ),
    );
  }
}

class HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    //Propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 2;

    final path = new Path();

    //Desenhar o caminho//Dibujar eon el path el lapiz

    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.23);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: HeaderTriangularPainter(),
      ),
    );
  }
}

class HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    //Propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 2;

    final path = new Path();

    //Desenhar o caminho//Dibujar eon el path el lapiz

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // // path.lineTo(0, 0);

    // path.lineTo(size.width, size.height );
    // path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: HeaderPicoPainter(),
      ),
    );
  }
}

class HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    //Propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = new Path();

    //Desenhar o caminho//Dibujar eon el path el lapiz

    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // path.lineTo(size.width, size.height );
    // path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: HeaderCurvoPainter(),
      ),
    );
  }
}

class HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    //Propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = new Path();

    //Desenhar o caminho//Dibujar eon el path el lapiz

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // path.lineTo(size.width, size.height );
    // path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: HeaderWavesPainter(),
      ),
    );
  }
}

class HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(0.0, 55.0), radius: 180);

    // final Gradient gradiente = new LinearGradient(
    //   begin: Alignment.topCenter,
    //   end: Alignment.bottomCenter,
    //   colors: <Color>[
    //     Color(0xff6D05E8),
    //     Color(0xffC012FF),
    //     Color(0xff6D05FA),
    //   ],
    //   stops: [
    //     0.2,
    //     0.5,
    //     1.0
    //   ]
    // );

    final lapiz = Paint(); //..shader = gradiente.createShader(rect);

    //Propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = new Path();

    //Desenhar o caminho//Dibujar eon el path el lapiz

    // path.lineTo(0, size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width , size.height * 0);
    // path.lineTo(size.width * 0.10, 0);

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // path.lineTo(size.width, size.height );
    // path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderOndas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: HeaderOndasPainter(),
      ),
    );
  }
}

class HeaderOndasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    //Propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 2;

    final path = new Path();

    //Desenhar o caminho//Dibujar eon el path el lapiz

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // path.lineTo(size.width, size.height );
    // path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
