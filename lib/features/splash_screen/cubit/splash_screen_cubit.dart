import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  SplashScreenCubit() : super(SplashInitial());

  Future<void> checkToken() async {
    emit(SplashLoading());

    try {
      String? token = await _storage.read(key: 'token');
      
      if (token != null) {
        print('Токен имеется');
        emit(SplashTokenAvailable());
      } else {
        print('Токена нет');
        emit(SplashNoToken());
      }
    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }
}
