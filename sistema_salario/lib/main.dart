import 'package:flutter/material.dart';
import 'package:sistema_salario/salario_page.dart';

void main() {
  runApp(const AppSalario());
}

class AppSalario extends StatelessWidget {
  const AppSalario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salário (App)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SalarioHome(title: 'Cálculo de Salário'),
    );
  }
}
