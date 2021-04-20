import 'package:animacoes/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Slideshow(
          primaryColor: Color(0xffFF5A7E),
          bulletPrimario: 20,
          pontosAcima: false,
          slides: [
            SvgPicture.asset('assets/images/slide-1.svg'),
            SvgPicture.asset('assets/images/slide-2.svg'),
            SvgPicture.asset('assets/images/slide-3.svg'),
            SvgPicture.asset('assets/images/slide-4.svg'),
            SvgPicture.asset('assets/images/slide-5.svg'),
          ],
        ),
      ),
    );
  }
}
