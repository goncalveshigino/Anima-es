
import 'package:animacoes/src/pages/launcher_page.dart';
import 'package:animacoes/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => new ThemeChanger(2),
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) {

  final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
        theme: currentTheme,
        debugShowCheckedModeBanner: false,
        title: 'Desenhos App',
        home: LauncherPage());
  }
}
