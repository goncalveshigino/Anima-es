

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class IconEmergency extends StatelessWidget {

   const IconEmergency(
       { 
         @required this.iconData, 
         @required this.titulo, 
         @required this.subtitulo, 
         this.color1 = Colors.grey,
         this.color2 = Colors.blueGrey
        }
             
      );

  final IconData iconData;
  final String titulo; 
  final String subtitulo;
  final Color color1; 
  final Color color2;

  

 
  Widget build(BuildContext context) {

  final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
       children: [

          IconHeaderBackground(color1: this.color1, color2: this.color2,), 

          Positioned(
            top: -50,
            left: -70,
            child: FaIcon(
              this.iconData, 
              size: 250,
              color: Colors.white.withOpacity(0.2),
            )
          ),


          Column(
            children: [

              SizedBox(height: 80, width: double.infinity,), 
              Text(
                this.subtitulo, 
                style: TextStyle(
                  color: colorBlanco, 
                  fontSize: 20
                ),        
              ), 
              
              SizedBox(height: 20,), 

              Text(
               this.titulo, 
                style: TextStyle(
                  color: colorBlanco, 
                  fontSize: 25, 
                  fontWeight: FontWeight.bold
                ), 
              ), 

              SizedBox(height: 20,), 

            FaIcon(
                this.iconData, 
                size: 80,
                color: Colors.white,
            )
            ],
          ), 
       ],
    );
  }
}

class IconHeaderBackground extends StatelessWidget {
  const IconHeaderBackground({
     @required this.color1,
     @required this.color2,
  });

  final Color color1; 
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
       decoration: BoxDecoration(
          color: Colors.blue[300], 
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80)
          ), 
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
             this.color1, 
             this.color2
            ]
          )
       ),
    );
  }
}
