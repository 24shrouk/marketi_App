part of 'active_reset_password_cubit.dart';

@immutable
abstract class ActiveResetPasswordState {}

class ActiveResetPasswordInitial extends ActiveResetPasswordState {}

class ActiveResetPasswordLoading extends ActiveResetPasswordState {}

class ActiveResetPasswordSuccess extends ActiveResetPasswordState {}

class ActiveResetPasswordError extends ActiveResetPasswordState {
  final String message;
  ActiveResetPasswordError(this.message);
}
