import 'package:animacoes/src/widgets/emergrncy/bottom_gordo.dart';
import 'package:animacoes/src/widgets/emergrncy/icon_emergency.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: BottomGordo (
            icon: FontAwesomeIcons.carCrash,
            text: "Motor Accident",
            color1:Color(0xff6989F5),
            color2: Color(0xff906EF5),
            onPress: (){
              print('Click');
            }
         ),
       )
    );
  }
}

class PageEmergency extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconEmergency(
      iconData: FontAwesomeIcons.plus,
      subtitulo: 'Has Solicitado',
      titulo: 'Assistencia Medica',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}

