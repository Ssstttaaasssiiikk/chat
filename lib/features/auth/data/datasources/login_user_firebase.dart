import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginUserFirebase {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  final _storage = const FlutterSecureStorage();

  Future<void> loginUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: emailAddress, 
        password: password
      );
      User? user = userCredential.user;
      

      if (user != null) {
        String? token = userCredential.user!.refreshToken;
        _storage.write(key: 'token', value: token);
        DocumentSnapshot userDoc = await _store.collection('users').doc(user.uid).get();
        String name = userDoc['Name'];
        String login = userDoc['Login'];
        String emailAddress = userDoc['EmailAddress'];
        String password = userDoc['Password'];
        print('Полученные данные \n $name $login $emailAddress $password');
      } 
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Такого пользователя не существует');
      } else if (e.code == 'wrong-password') {
        print('Такого пользователя не существует');
      } 
    } catch (e) {
      print(e);
    }
  }
}