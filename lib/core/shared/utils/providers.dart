import 'package:chat/features/auth/presentation/cubit/create_user_cubit/create_user_cubit.dart';
import 'package:chat/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  BlocProvider(create: (_) => locator<CreateUserCubit>()),
  //BlocProvider(create: (_) => locator<LoginUserScrean>()),
];
