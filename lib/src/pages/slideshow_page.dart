import 'package:animacoes/src/theme/theme.dart';
import 'package:animacoes/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MeuSlideShow()),
          Expanded(child: MeuSlideShow())
        ],
      ),
    );
  }
}

class MeuSlideShow extends StatelessWidget {
  const MeuSlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

   
   final appTheme = Provider.of<ThemeChanger>(context);
   final accentColor = appTheme.currentTheme.accentColor;

    return Slideshow(
      primaryColor: (appTheme.darkTheme) ? accentColor: Color(0xffFF5A7E),
      bulletPrimario: 20,
      pontosAcima: false,
      slides: [
        SvgPicture.asset('assets/images/slide-1.svg'),
        SvgPicture.asset('assets/images/slide-2.svg'),
        SvgPicture.asset('assets/images/slide-3.svg'),
        SvgPicture.asset('assets/images/slide-4.svg'),
        SvgPicture.asset('assets/images/slide-5.svg'),
      ],
    );
  }
}
