part of 'login_cubit.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  LoginErrorState(String string);
}
