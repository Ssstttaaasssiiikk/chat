import 'package:chat/core/routes/routes_name.dart';
import 'package:chat/features/auth/presentation/pages/create_user_screan.dart';
import 'package:chat/features/auth/presentation/pages/login_user_screan.dart';
import 'package:flutter/material.dart';

class RoutesPage {
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.login: (context) => const LoginUserScrean(),
    Routes.register: (context) => const CreateUserScrean(),
  };
}
