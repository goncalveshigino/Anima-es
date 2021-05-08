import 'package:animacoes/src/widgets/emergrncy/bottom_gordo.dart';
import 'package:animacoes/src/widgets/emergrncy/icon_emergency.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 



class ItemBoton {

  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.text, this.color1, this.color2 );
}



class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    
    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];
    
    List<Widget> itemMap = items.map(
      (item) => FadeInLeft(
        duration: Duration( milliseconds: 350),
        child: BottomGordo(
          icon: item.icon, 
          text: item.text, 
          color1: item.color1,
          color2: item.color2,
          onPress: (){ print('Hola'); },
        ),
      )
    ).toList();

    return Scaffold(
       body: Stack(
         children: [

           Container(
             margin: EdgeInsets.only(top: 200),
             child: ListView(
               physics: BouncingScrollPhysics(),
                children: [
                  SizedBox( height: 80,),
                  ...itemMap, 
                ],
             ),
           ),

          _Encabezado()

         ],
       )
    );
  }
}

class _Encabezado extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconEmergency(
          iconData: FontAwesomeIcons.plus, 
          titulo: 'Assistencia Medica', 
          subtitulo: 'Haz solicitado', 
          color2: Color(0xff66A9F2),
          color1: Color(0xff536CF6),
        ),

        Positioned(
          right: 0, 
          top: 40,
          child: RawMaterialButton(
            onLongPress: (){},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon( FontAwesomeIcons.ellipsisV, 
            color: Colors.white
            ),
          )
        )
      ],
    );
  }
}

class BottomGordoTemp extends StatelessWidget {
  const BottomGordoTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomGordo (
       icon: FontAwesomeIcons.carCrash,
       text: "Motor Accident",
       color1:Color(0xff6989F5),
       color2: Color(0xff906EF5),
       onPress: (){
         print('Click');
       }
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

