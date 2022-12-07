import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Exemplo com monitoramento de estado",
    home: FavorityCity(),
  ));
}

class FavorityCity extends StatefulWidget {
  const FavorityCity({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FavorityCityState();
  }
}

class _FavorityCityState extends State<FavorityCity> {
  String nameCity = "";
  @override
  Widget build(Object context) {
    debugPrint("FavorityCity foi criada");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exemplo com estado"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (String userInput) {
                setState(() {
                  debugPrint(
                      "Método set State foi chamado, ele redesenha o widget FavorityCity");
                  nameCity = userInput;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Sua cidade favorita é $nameCity",
                style: const TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
