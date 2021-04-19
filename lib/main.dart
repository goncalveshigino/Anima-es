import 'package:animacoes/src/labs/slideshow_page.dart';
import 'package:flutter/material.dart';

import 'src/pages/graficas_circulares_page.dart';
import 'src/pages/slideshow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Desenhos App',
        home: SlideShowPage());
  }
}
