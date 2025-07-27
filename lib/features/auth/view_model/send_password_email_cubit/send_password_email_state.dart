part of 'send_password_email_cubit.dart';

@immutable
abstract class SendPasswordEmailState {}

class SendPasswordEmailInitial extends SendPasswordEmailState {}

class SendPasswordEmailLoading extends SendPasswordEmailState {}

class SendPasswordEmailSuccess extends SendPasswordEmailState {}

class SendPasswordEmailError extends SendPasswordEmailState {
  final String message;
  SendPasswordEmailError(this.message);
}
