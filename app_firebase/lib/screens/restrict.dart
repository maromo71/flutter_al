import 'package:app_firebase/lista_livros.dart';
import 'package:app_firebase/models/usuario.dart';
import 'package:app_firebase/screens/sigin.dart';
import 'package:app_firebase/services/flutter_fire_auth.dart';
import 'package:flutter/material.dart';

class Restrict extends StatelessWidget {
  const Restrict({super.key, required this.usuario});

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    void signOut() async {
      await FlutterFireAuth(context).signOut();

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const SignIn()),
          (route) => false);
    }

    void navigateBookList() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ListaLivros()),
          (route) => false);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Área Restrita'),
          actions: [
            IconButton(
              onPressed: signOut,
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(218, 219, 223, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: IntrinsicHeight(
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: usuario.avatar == null
                          ? Image.asset(
                              'assets/user.png',
                              height: 80,
                            )
                          : ClipOval(
                              child: Image.network(usuario.avatar!,
                                  width: 80, height: 80, loadingBuilder:
                                      (BuildContext context, Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                            ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: VerticalDivider(
                        color: Color.fromARGB(218, 219, 223, 1),
                        width: 1,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const Text('Nome: '),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 42,
                            child: TextFormField(
                              initialValue: usuario.nome,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: '',
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text('Email: '),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 42,
                            child: TextFormField(
                              initialValue: usuario.email,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: '',
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: navigateBookList,
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 48),
                        ),
                      ),
                      child: const Text(
                        'Acesso Lista de Livros',
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
