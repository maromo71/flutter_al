import 'formulario_compra.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ComprasApp());
}

class ComprasApp extends StatelessWidget {
  const ComprasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
      ),
      home: Scaffold(
        body: FormularioCompra(),
      ),
    );
  }
}
