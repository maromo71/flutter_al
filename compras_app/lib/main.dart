import 'package:flutter/material.dart';
import 'lista_compras.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
      ),
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
