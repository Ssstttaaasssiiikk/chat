part of 'splash_screen_cubit.dart';

abstract class SplashScreenState {}

class SplashInitial extends SplashScreenState {}

class SplashLoading extends SplashScreenState {}

class SplashTokenAvailable extends SplashScreenState {}

class SplashNoToken extends SplashScreenState {}

class SplashError extends SplashScreenState {
  final String errorMessage;
  SplashError(this.errorMessage);
}
