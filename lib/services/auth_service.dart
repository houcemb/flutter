import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      // Handle error
      print(e.toString());
      rethrow; // Rethrow the error to be handled by the caller
    }
  }


  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      // Handle error
      print(e.toString());
      rethrow; // Rethrow the error to be handled by the caller
    }
  }



  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
