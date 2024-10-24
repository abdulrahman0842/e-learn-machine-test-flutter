import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerUser(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      log('Unable to Register');
    }
    return null;
  }

  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log("Cred: $credential");
      return credential.user;
    } catch (e) {
      log('Unable to Login: $e');
    }
    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
