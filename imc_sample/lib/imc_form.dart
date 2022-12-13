import 'package:flutter/material.dart';

class FormImc extends StatefulWidget {
  const FormImc({super.key});

  @override
  State<FormImc> createState() => _FormImcState();
}

class _FormImcState extends State<FormImc> {
  String _info = 'Informe seus dados';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  void _resetFields() {
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      _info = "Informe seus dados.";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcular() {
    setState(() {
      if (pesoController.text == '' || alturaController.text == '') {
        _info = 'Informe corretamente os dados';
        return;
      }
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      print(imc);
      if (imc < 18.6) {
        _info = 'Abaixo do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc < 24.9) {
        _info = 'Peso Ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc < 29.9) {
        _info = 'Levemente Acima do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc < 34.9) {
        _info = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc < 39.9) {
        _info = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      } else {
        _info = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Peso da pessoa em kg',
            ),
            controller: pesoController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Altura da pessoa em cm',
            ),
            controller: alturaController,
          ),
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
                print('clicou');
                _calcular();
              },
            ),
          ]),
        ),
      ],
    );
  }
}
