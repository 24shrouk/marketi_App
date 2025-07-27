import 'package:bloc/bloc.dart';
import 'package:marketi/core/data/remote_data/api_reset_password.dart';
import 'package:marketi/features/auth/model/request/active_reset_password.dart';
import 'package:meta/meta.dart';

part 'active_reset_password_state.dart';

class ActiveResetPasswordCubit extends Cubit<ActiveResetPasswordState> {
  ActiveResetPasswordCubit() : super(ActiveResetPasswordInitial());

  Future<void> activeResetPassword(String email, String code) async {
    emit(ActiveResetPasswordLoading());
    try {
      await ApiResetPassword.activeResetPasswordresponse(
        ActiveResetPasswordRequset(email: email, code: code),
      );
      emit(ActiveResetPasswordSuccess());
    } catch (e) {
      emit(ActiveResetPasswordError(e.toString()));
    }
  }
}
