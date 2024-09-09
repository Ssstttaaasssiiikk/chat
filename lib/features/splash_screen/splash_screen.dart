import 'package:chat/features/splash_screen/cubit/splash_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat/core/routes/routes_name.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit()..checkToken(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: BlocListener<SplashScreenCubit, SplashScreenState>(
              listener: (context, state) async {
                if (state is SplashTokenAvailable) {
                  await Future.delayed(const Duration(seconds: 3));
                  Navigator.pushReplacementNamed(context, Routes.page);
                } else if (state is SplashNoToken) {
                  await Future.delayed(const Duration(seconds: 3));
                  Navigator.pushReplacementNamed(context, Routes.login);
                }
              },
              child: BlocBuilder<SplashScreenCubit, SplashScreenState>(
                builder: (context, state) {
                  if (state is SplashLoading) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Будет дизайн, будет нормальный загрузочный экран'),
                        SizedBox(height: 20),
                        CircularProgressIndicator(),
                      ],
                    );
                  } else if (state is SplashError) {
                    return const Text('Ошибка загрузки токена');
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
