
import 'package:animacoes/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:animacoes/src/routes/routes.dart';
import 'package:provider/provider.dart';

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
       
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
       itemBuilder: (context, i) => ListTile(
          
          leading: FaIcon( pageRoutes[i].icon, color: appTheme.accentColor),
          title: Text(pageRoutes[i].titulo),
          trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> pageRoutes[i].page ));
          },
       ),

    );
  }
}



class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


   final appTheme = Provider.of<ThemeChanger>(context);
   final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
          child: Column(
            children: [


              SafeArea(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: accentColor,
                    child: Text('GH', style: TextStyle( fontSize: 50)),
                  ),
                ),
              ), 


              Expanded(

                 child: _ListaOpciones(),
              ),

               

             ListTile(
               leading: Icon( Icons.lightbulb_outline, color: accentColor),
               title: Text('Dark Mode'),
               trailing: Switch.adaptive(
                 value: appTheme.darkTheme, 
                 activeColor: accentColor,
                 onChanged: (value) => appTheme.darkTheme = value  
               ),
             ),


            SafeArea(
              bottom: true,
              top: false,
              right: false,
              left: false,
              child: ListTile(
                 leading: Icon( Icons.add_to_home_screen, color: accentColor),
                 title: Text('Custom Theme'),
                 trailing: Switch.adaptive(
                   activeColor: accentColor,
                   value: appTheme.customTheme, 
                    onChanged: (value) => appTheme.customTheme = value  
                 ),
               ),
            ),

            ],
          ),
      ),
    );
  }
}