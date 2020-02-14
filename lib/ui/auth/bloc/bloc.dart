import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:dlp_officer/ui/auth/bloc/event.dart';
import 'package:dlp_officer/ui/auth/bloc/state.dart';
import 'package:dlp_officer/domain/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({@required authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository;

  @override
  AuthState get initialState => AuthState.empty();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthSubmitted) {
      yield AuthState.submitting();
      var result =
          await _authRepository.authenticate(event.username, event.password);
      if (result.isSuccess()) {
        yield AuthState.success();
      } else {
        yield AuthState.failure(result.code);
      }
    } else if (event is CredentialsTyped) {
      final isFormEnabled = event.username.isNotEmpty &&
          event.password.isNotEmpty &&
          event.password.length >= 5;
      //-
      final isStateEmpty = !state.isSuccess && !state.isFailure;
      if (isStateEmpty) {
        yield state.update(isFormEnabled: isFormEnabled);
      } else {
        yield AuthState.empty().update(isFormEnabled: isFormEnabled);
      }
    } else if (event is PasswordTogglePressed) {
      yield state.update(isPasswordObscured: !state.isPasswordObscured);
    }
  }
}
