
import 'package:animacoes/src/theme/theme.dart';
import 'package:animacoes/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Scaffold(
      body: HeaderWaves(color: accentColor),
    );
  }
}
