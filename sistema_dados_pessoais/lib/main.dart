import 'package:flutter/material.dart';

import 'pessoais_page.dart';

void main() {
  runApp(const PessoaisApp());
}

class PessoaisApp extends StatelessWidget {
  const PessoaisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PessoaisPage(title: 'Manutenção agenda'),
    );
  }
}
