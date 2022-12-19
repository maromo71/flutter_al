import 'package:flutter/material.dart';

class ItemCompra extends StatelessWidget {
  const ItemCompra({super.key, required this.nomeProduto, required this.valor});

  final String nomeProduto;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.monetization_on_outlined,
        ),
        title: Text(nomeProduto),
        subtitle: Text(valor),
      ),
    );
  }
}
