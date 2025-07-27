import 'package:bloc/bloc.dart';
import 'package:marketi/core/data/remote_data/api_reset_password.dart';
import 'package:marketi/features/auth/model/request/reset_password_request.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> resetPassword(
    String email,
    String password,
    String confirmePassword,
  ) async {
    emit(ResetPasswordLoading());
    try {
      await ApiResetPassword.resetPasswordResponse(
        ResetPasswordRequest(
          email: email,
          password: password,
          confirmPassword: confirmePassword,
        ),
      );
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordError(e.toString()));
    }
  }
}
