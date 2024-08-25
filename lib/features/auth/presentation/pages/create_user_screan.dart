import 'package:chat/core/customs/input.dart';
import 'package:chat/features/auth/presentation/cubit/create_user_cubit/create_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUserScrean extends StatelessWidget {
  const CreateUserScrean({super.key});

  @override
  Widget build(BuildContext context) {
    var createUserCubit = CreateUserCubit.get(context);
    return BlocBuilder<CreateUserCubit, CreateUserState>(
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Регистрация пользователя'),
                const SizedBox(height: 30),
                Input(
                    labelText: 'Имя',
                    hintText: 'Введите имя',
                    controller: createUserCubit.name),
                Input(
                    labelText: 'Логин',
                    hintText: 'Введите логин',
                    controller: createUserCubit.login),
                Input(
                    labelText: 'Почта',
                    hintText: 'Введите почту',
                    controller: createUserCubit.emailAddress),
                Input(
                    labelText: 'Пароль',
                    hintText: 'Введите пароль',
                    controller: createUserCubit.password),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      createUserCubit.createUser();
                    },
                    child: const Text('Создать аккаунт'))
              ],
            ),
          ),
        ));
      },
    );
  }
}
