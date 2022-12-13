import 'package:flutter/material.dart';

import 'compras_page.dart';

void main() {
  runApp(const AppCompras());
}

class AppCompras extends StatelessWidget {
  const AppCompras({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Compras',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const PageCompras(title: 'Sistema de Compras'),
    );
  }
}
