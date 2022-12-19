import 'dart:ffi';

import 'package:compras_app/item_compra.dart';
import 'package:flutter/material.dart';

class FormularioCompra extends StatelessWidget {
  FormularioCompra({super.key});

  final TextEditingController _nomeProdutoController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  _cadastrar() {
    final String nomeProduto = _nomeProdutoController.text;
    final String valorProduto = _valorController.text;
    if (nomeProduto == '' || valorProduto == '') {
      return; //segurança
    }
    final itemCompra =
        ItemCompra(nomeProduto: nomeProduto, valor: valorProduto);
    debugPrint(itemCompra.nomeProduto);
    debugPrint(itemCompra.valor);
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
              controlador: _nomeProdutoController,
              rotulo: 'Nome do Produto',
              dica: 'Nome do produto',
              possuiDecimal: false),
          Editor(
              controlador: _valorController,
              rotulo: 'Valor do Produto',
              dica: '9.99',
              icone: Icons.monetization_on,
              possuiDecimal: true),
          ElevatedButton(
            onPressed: () {
              _cadastrar();
            },
            child: const Text('Cadastrar'),
          )
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;
  final bool possuiDecimal;

  const Editor(
      {super.key,
      required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icone,
      required this.possuiDecimal});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
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
        keyboardType: possuiDecimal
            ? const TextInputType.numberWithOptions(decimal: true)
            : const TextInputType.numberWithOptions(decimal: false),
      ),
    );
  }
}
