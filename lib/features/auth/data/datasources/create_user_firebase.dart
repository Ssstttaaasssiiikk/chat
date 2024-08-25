import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserFirebase {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  Future<String?> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required String login,
    required String name,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailAddress, 
        password: password
      );

      await _store.collection('users').doc(userCredential.user?.uid).set({
        'Login': login,
        'Password': password,
        'EmailAddress': emailAddress,
        'Name': name
      });

      return null;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        return 'email-already-in-use';
      } else {
        return 'Error: ${e.message}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
