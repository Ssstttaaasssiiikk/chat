import 'package:chat/core/customs/input.dart';
import 'package:chat/core/routes/routes_name.dart';
import 'package:chat/features/auth/data/datasources/login_user_firebase.dart';
import 'package:flutter/material.dart';

class LoginUserScrean extends StatelessWidget{
  const LoginUserScrean({super.key});

  @override
  Widget build(BuildContext context) {
    final emailAddress = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text('Авторизация пользователя'),
              const SizedBox(height: 30),
              Input(labelText: 'Почта', hintText: 'Введите почту', controller: emailAddress),
              Input(labelText: 'Пароль', hintText: 'Введите пароль', controller: password),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  LoginUserFirebase().loginUserWithEmailAndPassword(
                    emailAddress: emailAddress.text, 
                    password: password.text, 
                  );
                }, 
                child: const Text('Войти в аккаунт')
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.register);
                }, 
                child: const Text('Создать аккаунт')
              )
            ],
          ),
        ),
      )
    );
  }
}

