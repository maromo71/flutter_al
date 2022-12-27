import 'dart:io';

import 'package:app_firebase/models/usuario.dart';
import 'package:app_firebase/screens/restrict.dart';
import 'package:app_firebase/services/flutter_fire_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File? avatar;
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void navigateToRestrito(Usuario usuario) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Restrict(
            usuario: usuario,
          ),
        ),
      );
    }

    void uploadIamge() async {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (result != null) {
        setState(() {
          avatar = File(result.files.first.path!);
        });
      }
    }

    void submit() async {
      final nome = nomeController.text;
      final email = emailController.text;
      final senha = passwordController.text;

      setState(() => _isLoading = true);

      final usuario = await FlutterFireAuth(context)
          .createUserWithEmailAndPassword(nome, email, senha, avatar);

      setState(() => _isLoading = false);

      if (usuario != null) {
        navigateToRestrito(usuario);
      }
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Criar Conta'),
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (avatar != null)
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: FileImage(avatar!),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        )
                      else
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/user.png',
                            height: 120,
                          ),
                        ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: uploadIamge,
                          child: const Text(
                            'Buscar Foto',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        height: 42,
                        child: TextField(
                          controller: nomeController,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                            hintText: 'Nome',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        height: 52,
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        height: 52,
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            hintText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: submit,
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(220, 40),
                            ),
                          ),
                          child: const Text('Salvar'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
