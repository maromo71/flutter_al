import 'package:compras_app/formulario_compra.dart';
import 'package:compras_app/model/compra.dart';
import 'package:flutter/material.dart';
import 'item_compra.dart';

class ListaCompras extends StatelessWidget {
  const ListaCompras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ItemCompra(
              compra: Compra(nomeProduto: 'coca-cola', valorProduto: 2.89)),
          ItemCompra(
              compra: Compra(nomeProduto: 'fanta-uva', valorProduto: 2.22)),
          ItemCompra(
              compra:
                  Compra(nomeProduto: 'sprite garrafa', valorProduto: 2.77)),
        ],
      ),
      appBar: AppBar(
        title: const Text('Lista de Compras'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Compra?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioCompra();
          }));
          future.then((compraEfetuada) {
            debugPrint('Opa: $compraEfetuada');
            debugPrint('Chegou no future');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
