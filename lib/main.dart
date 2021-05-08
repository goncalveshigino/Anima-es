import 'package:animacoes/src/pages/pinterest_page.dart';
import 'package:animacoes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'src/pages/launcher_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Desenhos App',
        home: LauncherPage());
  }
}
