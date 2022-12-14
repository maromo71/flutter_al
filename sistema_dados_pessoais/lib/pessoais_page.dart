import 'package:flutter/material.dart';

class PessoaisPage extends StatefulWidget {
  const PessoaisPage({super.key, required this.title});

  final String title;

  @override
  State<PessoaisPage> createState() => _PessoaisPageState();
}

class _PessoaisPageState extends State<PessoaisPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController foneController = TextEditingController();

  String _info = 'Dados da Pessoa';

  void _registrar() {
    setState(() {
      if (nameController.text == '' ||
          emailController.text == '' ||
          foneController.text == '') {
        _info = 'Dados incompletos. Acerte a entrada';
        return;
      }
      String name = nameController.text;
      String email = emailController.text;
      String fone = foneController.text;

      _info = 'Dados completos: \nNome $name \nEmail: $email\nFone: $fone\n';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nome da Pessoa',
                ),
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email da Pessoa:',
                ),
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Telefone da Pessoa:',
                ),
                controller: foneController,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  _info,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _registrar(),
        tooltip: 'Cadastrar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
