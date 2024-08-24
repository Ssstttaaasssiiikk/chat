import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserFirebase {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  Future<void> createUserWithEmailAndPassword({
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

      _store.collection('users').doc(userCredential.user?.uid).set({
        'Login': login,
        'Password': password,
        'EmailAddress': emailAddress,
        'Name': name
      });

      print('Пользователь успешно сохранен');
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Слабый пароль');
      } else if (e.code == 'email-already-in-use') {
        print('Данный адрес электронной почты уже занят');
      }
    } catch (e) {
      print('У нас ошибка: $e');
    }
  }
}