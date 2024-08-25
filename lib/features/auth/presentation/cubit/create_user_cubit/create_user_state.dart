part of 'create_user_cubit.dart';

class CreateUserState {}

class CreateUserInitial extends CreateUserState {}

class StartedCreatingUser extends CreateUserState {}

class SuccessfulUserCreation extends CreateUserState {}

class ErrorMailInUse extends CreateUserState {}

class ErrorWeakPassword extends CreateUserState {}

class ErrorCreatingUser extends CreateUserState {}

class ErrorLoginInUse extends CreateUserState {}

class StartAuthorization extends CreateUserState {}

class SuccessfulAuthorization extends CreateUserState {}

class ErrorAuthorization extends CreateUserState {}
