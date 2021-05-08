import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

class BottomGordo extends StatelessWidget {

  final IconData icon;
  @required final String text;
  final Color color1;
  final Color color2;
  @required final Function onPress;

  const BottomGordo(
    {
       this.icon = FontAwesomeIcons.circle, 
       this.text, 
       this.color1 = Colors.grey, 
       this.color2 = Colors.blueGrey, 
       this.onPress
    }
  );




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [

          _BottomGordoBackground( this.icon, this.color1, this.color2), 

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox( height: 140, width: 40,),
              FaIcon(
                this.icon,
                color: Colors.white, 
                size: 40
              ), 
              SizedBox( width: 40,),
              Expanded(
                child: Text( this.text, style: TextStyle( color: Colors.white, fontSize: 18),)
              ), 
               FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white, 
                
              ), 
              SizedBox( width: 40,),
            ],
          )
        ],
      ),
    );
  }


}

class _BottomGordoBackground extends StatelessWidget {



  final IconData icon;
  final Color color1;
  final Color color2;

  const _BottomGordoBackground(
      this.icon, 
      this.color1, 
      this.color2 
  );

  @override
  Widget build(BuildContext context) {
    return Container(

         child: ClipRRect(
           borderRadius: BorderRadius.circular(15),
           child: Stack(
             children: [

               Positioned(
                  right: -15,
                  top: -15,
                 child:FaIcon(
                   FontAwesomeIcons.carCrash, 
                   size: 120, 
                   color: Colors.white.withOpacity(0.2)
                 )
               )
             ],
           ),
         ),


        width: double.infinity,
        height: 100, 
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2), 
              offset: Offset(4,6), 
              blurRadius: 20
            )
          ], 

          borderRadius: BorderRadius.circular(15), 
          gradient: LinearGradient(
            colors: [
            this.color1,
            this.color2
            ]
          )
        ),
    );
  }
}