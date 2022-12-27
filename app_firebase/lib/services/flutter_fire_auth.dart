import 'package:app_firebase/models/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FlutterFireAuth {
  FlutterFireAuth(this._context);
  late final BuildContext _context;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<Usuario?> createUserWithEmailAndPassword(
      String nome, String email, String senha, dynamic avatar) async {
    try {
      final credencial = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      String? arquivoUrl;

      await credencial.user?.updateDisplayName(nome);

      if (avatar != null) {
        final nomeArquivo =
            '${const Uuid().v4()}.${avatar!.path.split('.').last}';

        final arquivoRef = _storage.ref().child(nomeArquivo);

        await arquivoRef.putFile(avatar);

        arquivoUrl = await arquivoRef.getDownloadURL();

        await credencial.user?.updatePhotoURL(arquivoUrl);
      }
      return Usuario(avatar: arquivoUrl, nome: nome, email: email);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text('Erro:  + ${e.toString()}'),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void signInWithEmailAndPassword() {}

  void getLoggedUser() {}

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
