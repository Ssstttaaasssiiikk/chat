// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:chat/features/auth/data/datasources/login_user_firebase.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final emailAddress = TextEditingController();
  final password = TextEditingController();

  Future loginWithEmailAndPassword() async {
    if (emailAddress.text.isEmpty || password.text.isEmpty) return;
    emit(LoadingLoginState());
    LoginUserFirebase().loginUserWithEmailAndPassword(
        emailAddress: emailAddress.text, password: password.text);
  }
}
