import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
      ),
      home: const Tela(),
    );
  }
}

class Tela extends StatelessWidget {
  const Tela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                color: Colors.red,
              ),
              Container(
                width: 20,
                height: 20,
                color: Colors.yellow,
              ),
              Container(
                width: 20,
                height: 20,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Exemplo'),
      ),
    );
  }
}
