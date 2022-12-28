import 'package:app_firebase/screens/restrict.dart';
import 'package:app_firebase/screens/sigin.dart';
import 'package:app_firebase/services/flutter_fire_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppFirebase());
}

class AppFirebase extends StatelessWidget {
  const AppFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    final usuario = FlutterFireAuth(context).getLoggedUser();

    return MaterialApp(
      title: 'FlutterFire Auth',
      home: usuario != null ? Restrict(usuario: usuario) : const SignIn(),
    );
  }
}
