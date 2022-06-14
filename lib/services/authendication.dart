import 'package:firebase_auth/firebase_auth.dart';

class Authendication {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    return await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signup(String email, String password) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
