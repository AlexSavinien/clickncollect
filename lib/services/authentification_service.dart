import 'package:clickncollect_app/services/dialog_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final authentificationServiceProvider =
    Provider<AuthentificationService>((ref) {
  return AuthentificationService(
    ref.read(dialogServiceProvider),
  );
});

class AuthentificationService {
  final DialogService _dialogService;
  AuthentificationService(this._dialogService);

  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get onAuthStateChanged => _auth.authStateChanges();

  User get currentUser => _auth.currentUser;

  Future<String> signOut() async {
    await _auth.signOut();
    return 'success';
  }

  Future<String> signUp({@required email, @required password}) async {
    try {
      var res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      res != null ? print('user signed up') : print('user failed to sign up');
      return 'sucess';
    } on FirebaseAuthException catch (e) {
      _dialogService.showDialog(title: 'Erreur', description: e.message);
      return 'error';
    }
  }

  Future<String> signIn({@required email, @required password}) async {
    try {
      var res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      res != null ? print('user signed in') : print('user failed to signin');
      return 'sucess';
    } on FirebaseAuthException catch (e) {
      _dialogService.showDialog(title: 'Erreur', description: e.message);
      return 'error';
    }
  }
}
