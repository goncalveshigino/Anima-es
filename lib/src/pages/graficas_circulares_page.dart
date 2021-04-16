import 'package:animacoes/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double percentagem = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.refresh,
          ),
          backgroundColor: Colors.pink,
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
                  percentagem: percentagem,
                  color: Colors.purple,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentagem: percentagem,
                  color: Colors.red,
                ),
                CustomRadialProgress(
                  percentagem: percentagem,
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
    return Container(
      height: 150,
      width: 150,
      // color: Colors.red,
      child: RadialProgress(
        percentagem: percentagem,
        primaryColor: this.color,
        secundsColor: Colors.grey,
        grosorSecund: 4.0,
      ),
    );
  }
}
