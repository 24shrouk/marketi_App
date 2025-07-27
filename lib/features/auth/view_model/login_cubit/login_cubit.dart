import 'package:bloc/bloc.dart';
import 'package:marketi/core/data/remote_data/api_auth.dart';
import 'package:marketi/core/storage_helper/app_shared_pref.dart';
import 'package:marketi/features/auth/model/request/login_request.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      var response = await ApiAuth.login(
        LogInRequest(email: email, password: password),
      );
      await SharedPreferencesHelper.saveData(
        key: 'token',
        value: response.token,
      );
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
