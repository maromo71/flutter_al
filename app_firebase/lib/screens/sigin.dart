import 'package:app_firebase/models/usuario.dart';
import 'package:app_firebase/screens/restrict.dart';
import 'package:app_firebase/services/flutter_fire_auth.dart';
import 'package:flutter/material.dart';

import 'signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  bool signInEmailAndPasswordLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void resetForm() {
      _emailController.clear();
      _senhaController.clear();
    }

    void navigateToSignUp() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SignUp(),
        ),
      );
      resetForm();
    }

    void navigateToRestrict(Usuario usuario) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Restrict(usuario: usuario),
        ),
      );
    }

    void signInEmailAndPassword() async {
      final email = _emailController.text;
      final senha = _senhaController.text;

      setState(() {
        signInEmailAndPasswordLoading = true;
      });

      final usuario = await FlutterFireAuth(context)
          .signInWithEmailAndPassword(email, senha);

      setState(() {
        signInEmailAndPasswordLoading = false;
      });

      if (usuario != null) {
        resetForm();
        navigateToRestrict(usuario);
      }
    }

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/flutterfire.png',
                        height: 90,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      height: 54,
                      child: TextField(
                        controller: _emailController,
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
                    const SizedBox(
                      height: 28,
                    ),
                    SizedBox(
                      height: 54,
                      child: TextField(
                        controller: _senhaController,
                        obscureText: true,
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
                    const SizedBox(
                      height: 28,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: navigateToSignUp,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.redAccent,
                          ),
                          minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 48.0),
                          ),
                        ),
                        child: const Text(
                          'Criar uma conta',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: signInEmailAndPassword,
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 48),
                          ),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
