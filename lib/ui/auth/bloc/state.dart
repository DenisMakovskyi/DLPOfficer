import 'package:meta/meta.dart';

@immutable
class AuthState {
  final int code;
  final bool isSuccess;
  final bool isFailure;
  final bool isSubmitting;
  final bool isFormEnabled;
  final bool isPasswordObscured;

  AuthState(
      {@required this.code,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.isSubmitting,
      @required this.isFormEnabled,
      @required this.isPasswordObscured});

  factory AuthState.empty() {
    return AuthState(
        code: 0,
        isSuccess: false,
        isFailure: false,
        isSubmitting: false,
        isFormEnabled: false,
        isPasswordObscured: true);
  }

  factory AuthState.success() {
    return AuthState(
        code: 0,
        isSuccess: true,
        isFailure: false,
        isSubmitting: false,
        isFormEnabled: true,
        isPasswordObscured: true);
  }

  factory AuthState.failure(int code) {
    return AuthState(
        code: code,
        isSuccess: false,
        isFailure: true,
        isSubmitting: false,
        isFormEnabled: true,
        isPasswordObscured: true);
  }

  factory AuthState.submitting() {
    return AuthState(
        code: 0,
        isSuccess: false,
        isFailure: false,
        isSubmitting: true,
        isFormEnabled: false,
        isPasswordObscured: true);
  }

  AuthState update({bool isFormEnabled, bool isPasswordObscured}) {
    return copyWith(
        isFormEnabled: isFormEnabled, isPasswordObscured: isPasswordObscured);
  }

  AuthState copyWith({bool isFormEnabled, bool isPasswordObscured}) {
    return AuthState(
        code: this.code,
        isSuccess: this.isSuccess,
        isFailure: this.isFailure,
        isSubmitting: this.isSubmitting,
        isFormEnabled: isFormEnabled ?? this.isFormEnabled,
        isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured);
  }
}
