import 'package:animacoes/src/pages/animacoes_page.dart';
import 'package:animacoes/src/pages/emergency_page.dart';
import 'package:animacoes/src/pages/graficas_circulares_page.dart';
import 'package:animacoes/src/pages/header_page.dart';
import 'package:animacoes/src/pages/pinterest_page.dart';
import 'package:animacoes/src/pages/slider_page.dart';
import 'package:animacoes/src/pages/slideshow_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 



final pageRoutes = <_Route> [

    _Route( FontAwesomeIcons.slideshare, 'Slideshow', SlideShowPage()),
    _Route( FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
    _Route( FontAwesomeIcons.heading, 'Encabezados', HeadersPage()),
    _Route( FontAwesomeIcons.peopleCarry, 'Cuadro Animado', AnimacoesPage()),
    _Route( FontAwesomeIcons.circleNotch, 'Barra Progresso', GraficasCircularesPage()),
    _Route( FontAwesomeIcons.pinterest, 'Pintirest', PinterestPage()),
    _Route( FontAwesomeIcons.mobile, 'Slivers', SliderPage()),
    
    
];




class _Route {


    final IconData icon;
    final String titulo;
    final Widget page;

  _Route(this.icon, this.titulo, this.page);

    
}