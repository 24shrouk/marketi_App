import 'package:bloc/bloc.dart';
import 'package:marketi/core/data/remote_data/api_auth.dart';
import 'package:marketi/features/auth/model/request/register_request.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoading());
    try {
      await ApiAuth.register(
        RegisterRequest(
          email: email,
          name: name,
          password: password,
          phone: phone,
          confirmPassword: confirmPassword,
        ),
      );
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
