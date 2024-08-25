import 'package:chat/features/auth/data/datasources/create_user_firebase.dart';
import 'package:chat/features/auth/data/datasources/login_user_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit() : super(CreateUserInitial());

  static CreateUserCubit get(context) => BlocProvider.of(context);

  final emailAddress = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final login = TextEditingController();

  Future<void> createUser() async {
    if (_areInputFieldsEmpty()) {
      emit(ErrorCreatingUser());
      return;
    }

    emit(StartedCreatingUser());

    final error = await CreateUserFirebase().createUserWithEmailAndPassword(
      emailAddress: emailAddress.text,
      password: password.text,
      login: login.text,
      name: name.text,
    );

    if (error != null) {
      _handleUserCreationError(error);
      return;
    }

    final isLoginUnique = await checkLoginUnique(login.text);
    if (!isLoginUnique) {
      emit(ErrorLoginInUse());
      return;
    }

    await _loginUser();
  }

  bool _areInputFieldsEmpty() {
    return emailAddress.text.isEmpty ||
        name.text.isEmpty ||
        password.text.isEmpty ||
        login.text.isEmpty;
  }

  void _handleUserCreationError(String error) {
    switch (error) {
      case 'weak-password':
        emit(ErrorWeakPassword());
        break;
      case 'email-already-in-use':
        emit(ErrorMailInUse());
        break;
      default:
        emit(ErrorCreatingUser());
    }
  }

  Future<void> _loginUser() async {
    await LoginUserFirebase().loginUserWithEmailAndPassword(
      emailAddress: emailAddress.text,
      password: password.text,
    );
    emit(SuccessfulAuthorization());
  }

  Future<bool> checkLoginUnique(String login) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('Login', isEqualTo: login)
        .get();
    return result.docs.isEmpty;
  }
}
