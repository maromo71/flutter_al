// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ListaLivros extends StatefulWidget {
  const ListaLivros({super.key});

  @override
  State<ListaLivros> createState() => _ListaLivrosState();
}

class _ListaLivrosState extends State<ListaLivros> {
  final dbRef = FirebaseDatabase.instance.ref().child("livros");
  List<Map<dynamic, dynamic>> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Livros'),
        ),
        body: FutureBuilder<DatabaseEvent>(
            future: dbRef.once(),
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (snapshot.hasData) {
                list.clear();

                Map<dynamic, dynamic> values =
                    snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

                values.forEach((key, values) {
                  list.add(values);
                });
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                          key: values[index],
                          color: const Color.fromARGB(255, 234, 239, 238),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  child:
                                      Text('Autor: ' + list[index]['author']),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text("Título: " + list[index]['title']),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("ISBN: " + list[index]['isbn']),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      list[index]['url'],
                                      height: 200,
                                      width: 200,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
