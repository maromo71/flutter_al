import 'package:flutter/material.dart';
import 'item_compra.dart';

class ListaCompras extends StatelessWidget {
  const ListaCompras({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ItemCompra(
          nomeProduto: 'coca-cola',
          valor: '3,89',
        ),
        ItemCompra(
          nomeProduto: 'fanta-uva',
          valor: '3,33',
        ),
        ItemCompra(
          nomeProduto: 'skol lata',
          valor: '4,26',
        ),
      ],
    );
  }
}
