import 'package:flutter/material.dart';

class SalarioHome extends StatefulWidget {
  const SalarioHome({super.key, required this.title});
  final String title;
  @override
  State<SalarioHome> createState() => _SalarioHomeState();
}

class _SalarioHomeState extends State<SalarioHome> {
  String _info = 'Informe salário atual';
  String _perc = '';
  double _salario = 0.0;
  TextEditingController salarioController = TextEditingController();

  void _resetFields() {
    salarioController.text = '';
    setState(() {
      _info = "Informe salário atual.";
      _perc = "";
    });
  }

  void _calcularSalario() {
    setState(() {
      double perc = double.parse(_perc);
      if (salarioController.text == '') {
        _info = 'Preencher com salário.';
        return;
      }
      _salario = double.parse(salarioController.text);
      _info = 'Novo Salário R\$ ';
      if (perc == 10.0) {
        _salario = _salario * 1.1;
      } else if (perc == 15.00) {
        _salario = _salario * 1.15;
      } else {
        _salario = _salario * 1.2;
      }
      _info += _salario.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Salário base para cálculo'),
              controller: salarioController,
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Escolha o % de aumento',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          RadioListTile(
            title: const Text("10 %"),
            value: "10.0",
            groupValue: _perc,
            onChanged: (value) {
              setState(() {
                _perc = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text("15 %"),
            value: "15.0",
            groupValue: _perc,
            onChanged: (value) {
              setState(() {
                _perc = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text("20 %"),
            value: "20.0",
            groupValue: _perc,
            onChanged: (value) {
              setState(() {
                _perc = value!;
              });
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                _info,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 22),
                ),
                child: const Text('Calcular'),
                onPressed: () {
                  _calcularSalario();
                },
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 22),
                ),
                child: const Text('  Limpar'),
                onPressed: () {
                  _resetFields();
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
