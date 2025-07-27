import 'package:bloc/bloc.dart';
import 'package:marketi/core/data/remote_data/api_reset_password.dart';
import 'package:marketi/features/auth/model/request/send_password_email.dart';
import 'package:meta/meta.dart';

part 'send_password_email_state.dart';

class SendPasswordEmailCubit extends Cubit<SendPasswordEmailState> {
  SendPasswordEmailCubit() : super(SendPasswordEmailInitial());

  Future<void> sendPasswordEmail(String email) async {
    emit(SendPasswordEmailLoading());
    try {
      await ApiResetPassword.sendPasswordEmail(
        SendPasswordEmailRequest(email: email),
      );
      emit(SendPasswordEmailSuccess());
    } catch (e) {
      emit(SendPasswordEmailError(e.toString()));
    }
  }
}
