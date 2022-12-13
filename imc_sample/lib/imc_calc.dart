import 'package:flutter/material.dart';
import 'imc_form.dart';

class ImcCalc extends StatefulWidget {
  const ImcCalc({super.key});

  @override
  State<ImcCalc> createState() => _ImcCalcState();
}

class _ImcCalcState extends State<ImcCalc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Calculadora IMC"),
          ),
          body: const FormImc()),
    );
  }
}
