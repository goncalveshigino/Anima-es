import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Desenhos em Flutter'),
          ),
          drawer: _MenuPrincipal(),
        body: _ListaOpciones()
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
     // physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemCount: 15,
       itemBuilder: (context, i) => ListTile(
          
          leading: FaIcon( FontAwesomeIcons.slideshare, color: Colors.blue),
          title: Text('Hello world'),
          trailing: Icon(Icons.chevron_right, color: Colors.blue),
          onTap: () {

          },
       ),

    );
  }
}



class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(
            children: [


              SafeArea(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('GH', style: TextStyle( fontSize: 50)),
                  ),
                ),
              ), 


              Expanded(

                 child: _ListaOpciones(),
              ),

               

             ListTile(
               leading: Icon( Icons.lightbulb_outline, color: Colors.blue),
               title: Text('Dart Mode'),
               trailing: Switch.adaptive(
                 value: true, 
                 onChanged: (value){},
               ),
             ),


            ListTile(
               leading: Icon( Icons.add_to_home_screen, color: Colors.blue),
               title: Text('Custom Theme'),
               trailing: Switch.adaptive(
                 value: true, 
                 onChanged: (value){},
               ),
             ),

            ],
          ),
      ),
    );
  }
}