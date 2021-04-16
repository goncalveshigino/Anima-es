
import 'package:animacoes/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: HeaderPico(),
          ),
        ],
      ),
    );
  }
}
