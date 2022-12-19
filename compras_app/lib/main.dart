import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Compras'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: const ListaCompras(),
      ),
    ),
  );
}

class ListaCompras extends StatelessWidget {
  const ListaCompras({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Card(
          child: ListTile(
            leading: Icon(
              Icons.monetization_on_outlined,
            ),
            title: Text(
              'Coca-cola',
            ),
            subtitle: Text(
              '6.56',
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.monetization_on_outlined,
            ),
            title: Text(
              'Fanta-uva',
            ),
            subtitle: Text(
              '4.37',
            ),
          ),
        ),
      ],
    );
  }
}
