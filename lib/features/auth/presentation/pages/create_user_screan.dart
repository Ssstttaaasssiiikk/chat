import 'package:chat/core/customs/input.dart';
import 'package:chat/features/auth/data/datasources/create_user_firebase.dart';
import 'package:flutter/material.dart';

//создать блок и добавить проверку на уникальность вводимого лагина
// Future<bool> isUsernameUnique(String username) async {
//   final result = await FirebaseFirestore.instance
//       .collection('users')
//       .where('username', isEqualTo: username)
//       .get();
//   return result.docs.isEmpty;
// }

class CreateUserScrean extends StatelessWidget {
  const CreateUserScrean({super.key});

  @override
  Widget build(BuildContext context) {
    final emailAddress = TextEditingController();
    final password = TextEditingController();
    final login = TextEditingController();
    final name = TextEditingController();

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Регистрация пользователя'),
            const SizedBox(height: 30),
            Input(labelText: 'Имя', hintText: 'Введите имя', controller: name),
            Input(
                labelText: 'Логин',
                hintText: 'Введите логин',
                controller: login),
            Input(
                labelText: 'Почта',
                hintText: 'Введите почту',
                controller: emailAddress),
            Input(
                labelText: 'Пароль',
                hintText: 'Введите пароль',
                controller: password),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  CreateUserFirebase().createUserWithEmailAndPassword(
                    emailAddress: emailAddress.text,
                    password: password.text,
                    login: login.text,
                    name: name.text,
                  );
                },
                child: const Text('Создать аккаунт'))
          ],
        ),
      ),
    ));
  }
}
