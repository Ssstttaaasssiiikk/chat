import 'package:chat/features/auth/presentation/cubit/create_user_cubit/create_user_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory(() => CreateUserCubit());
  //locator.registerFactory(() => LoginCubit());
}
