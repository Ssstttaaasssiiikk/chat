import 'package:chat/core/customs/input.dart';
import 'package:chat/core/routes/routes_name.dart';
import 'package:chat/features/auth/presentation/cubit/login_user_cubit.dart/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginUserScrean extends StatelessWidget {
  const LoginUserScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Text('Авторизация пользователя'),
                const SizedBox(height: 30),
                BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      Navigator.pushReplacementNamed(context, Routes.page);
                    } else if (state is LoginErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ошибка авторизации')),
                      );
                    }
                  },
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Input(
                            labelText: 'Почта',
                            hintText: 'Введите почту',
                            controller: context.read<LoginCubit>().emailAddress,
                          ),
                          Input(
                            labelText: 'Пароль',
                            hintText: 'Введите пароль',
                            controller: context.read<LoginCubit>().password,
                          ),
                          const SizedBox(height: 20),
                          if (state is LoadingLoginState)
                            const CircularProgressIndicator()
                          else
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<LoginCubit>()
                                    .loginWithEmailAndPassword();
                              },
                              child: const Text('Войти в аккаунт'),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  child: const Text('Создать аккаунт'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
