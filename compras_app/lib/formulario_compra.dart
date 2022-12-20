import 'package:compras_app/model/compra.dart';
import 'package:flutter/material.dart';

class FormularioCompra extends StatelessWidget {
  FormularioCompra({super.key});

  final TextEditingController nomeProdutoController = TextEditingController();
  final TextEditingController valorProdutoController = TextEditingController();

  void _cadastrar(BuildContext context) {
    if (nomeProdutoController.text == '' || valorProdutoController.text == '') {
      return;
    }
    final String nomeProduto = nomeProdutoController.text;
    final double valorProduto = double.parse(valorProdutoController.text);
    final compraGerada =
        Compra(nomeProduto: nomeProduto, valorProduto: valorProduto);
    debugPrint('Compra gerada: $compraGerada');
    Navigator.pop(context, compraGerada);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compra de Produto'),
      ),
      body: Column(
        children: [
          Editor(
            controlador: nomeProdutoController,
            rotulo: 'Nome do Produto',
            dica: 'nome do produto',
          ),
          Editor(
            controlador: valorProdutoController,
            rotulo: 'Valor do Produto',
            dica: '0.00',
            decimal: true,
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            child: const Text('Cadastrar'),
            onPressed: () {
              _cadastrar(context);
            },
          )
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  const Editor(
      {super.key,
      required this.controlador,
      required this.rotulo,
      required this.dica,
      this.decimal,
      this.icone});

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final bool? decimal;
  final IconData? icone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controlador,
        style: const TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: decimal),
      ),
    );
  }
}
