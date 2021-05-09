import 'package:animacoes/src/theme/theme.dart';
import 'package:animacoes/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double percentagem = 0.0;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.refresh,
          ),
          backgroundColor: appTheme.accentColor,
          onPressed: () {
            setState(() {
              percentagem += 10;
              if (percentagem > 100) {
                percentagem = 0;
              }
            });
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentagem: percentagem,
                  color: Colors.green,
                ),
                CustomRadialProgress(
                  percentagem: percentagem * 1.2,
                  color: Colors.purple,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentagem: percentagem * 1.4,
                  color: Colors.red,
                ),
                CustomRadialProgress(
                  percentagem: percentagem * 1.6,
                  color: Colors.blue,
                ),
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress(
      {@required this.percentagem, @required this.color});

  final Color color;
  final double percentagem;
  

  @override
  Widget build(BuildContext context) {


  final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(   
      height: 150,
      width: 150,
      // color: Colors.red,
      child: RadialProgress(
        percentagem: percentagem,
        primaryColor: this.color,
        secundsColor: appTheme.textTheme.bodyText1.color,
        grosorSecund: 4.0,
      ),
    );
  }
}
