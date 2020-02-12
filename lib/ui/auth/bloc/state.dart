import 'package:meta/meta.dart';

@immutable
class AuthState {
  final bool isSuccess;
  final bool isFailure;
  final bool isSubmitting;
  final bool isPasswordValid;

  bool get isFormValid => isPasswordValid;

  AuthState({
    @required this.isSuccess,
    @required this.isFailure,
    @required this.isSubmitting,
    @required this.isPasswordValid,
  });

  factory AuthState.empty() {
    return AuthState(
      isSuccess: false,
      isFailure: false,
      isSubmitting: false,
      isPasswordValid: true
    );
  }

  factory AuthState.success() {
    return AuthState(
        isSuccess: true,
        isFailure: false,
        isSubmitting: false,
        isPasswordValid: true
    );
  }

  factory AuthState.failure() {
    return AuthState(
        isSuccess: false,
        isFailure: true,
        isSubmitting: false,
        isPasswordValid: true
    );
  }

  factory AuthState.submitting() {
    return AuthState(
        isSuccess: false,
        isFailure: false,
        isSubmitting: true,
        isPasswordValid: true
    );
  }


  AuthState update({
  bool isPasswordValid
  }) {
    return copyWith(
      isSuccess: isSuccess,
      isFailure: isFailure,
      isSubmitting: isSubmitting,
      isPasswordValid: isPasswordValid
    );
  }

  AuthState copyWith({
    bool isSuccess,
    bool isFailure,
    bool isSubmitting,
    bool isPasswordValid
  }) {
    return AuthState(
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid
    );
  }
}
