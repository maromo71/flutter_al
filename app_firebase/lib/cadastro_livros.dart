import 'dart:convert';
import 'package:app_firebase/lista_livros.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroLivros extends StatefulWidget {
  const CadastroLivros({super.key});

  @override
  State<CadastroLivros> createState() => _CadastroLivrosState();
}

class _CadastroLivrosState extends State<CadastroLivros> {
  final _baseUrl = 'https://biblio-rdb-app.firebaseio.com';

  final _form = GlobalKey<FormState>();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  void cadastrarLivro() async {
    _form.currentState?.save();
    if (titleController.text == '' ||
        authorController.text == '' ||
        isbnController.text == "" ||
        urlController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Corrija as informações para salvar novamente'),
          action: SnackBarAction(
            label: 'Corrija',
            onPressed: () {},
          ),
        ),
      );
      return;
    }
    final future = http.post(
      Uri.parse('$_baseUrl/livros.json'),
      body: jsonEncode({
        "title": titleController.text,
        "author": authorController.text,
        "isbn": isbnController.text,
        "url": urlController.text,
      }),
    );
    future.then((response) {
      debugPrint('Aqui já cadastrou na nuvem');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro gravado com sucesso')),
      );
      authorController.clear();
      titleController.clear();
      isbnController.clear();
      urlController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Livros'),
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: authorController,
                  decoration: const InputDecoration(
                      labelText: 'Autor do Livro',
                      hintText: 'Digite o nome do autor',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(0.5),
                      ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      labelText: 'Título do Livro',
                      hintText: 'Digite o título do livro',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(0.5),
                      ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: isbnController,
                  decoration: const InputDecoration(
                      labelText: 'ISBN do Livro',
                      hintText: 'Digite o ISBN do livro',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(0.5),
                      ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: urlController,
                  decoration: const InputDecoration(
                      labelText: 'URL da imagem - capa',
                      hintText: 'Digite o url completo',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(0.5),
                      ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                    onPressed: () {
                      cadastrarLivro();
                    },
                    child: const Text('Cadastrar'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListaLivros(),
                        ),
                      );
                    },
                    child: const Text('Listar Todos'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
