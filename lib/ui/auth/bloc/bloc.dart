import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'package:dlp_officer/utils/validators.dart';
import 'package:dlp_officer/ui/auth/bloc/event.dart';
import 'package:dlp_officer/ui/auth/bloc/state.dart';
import 'package:dlp_officer/domain/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthRepository _authRepository;

  AuthBloc({@required authRepository}): assert(authRepository != null), _authRepository = authRepository;

  @override
  AuthState get initialState => AuthState.empty();

  @override
  Stream<AuthState> transformEvents(
      Stream<AuthEvent> events,
      Stream<AuthState> Function(AuthEvent) next) {
    final nonDebounceStream = events.where((event) => event is! AuthPasswordChanged);
    final debounceStream = events
        .where((event) => event is AuthPasswordChanged)
        .debounceTime(Duration(milliseconds: 500));
    return super.transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthSubmitted) {
      yield AuthState.submitting();
      var result = await _authRepository.authenticate(event.username, event.password);
      if (result.isSuccess()) {
        yield AuthState.success();
      } else {
        yield AuthState.failure();
      }
    }

    if (event is AuthPasswordChanged) {
      yield state.update(isPasswordValid: Validators.isPasswordValid(event.password));
    }
  }
}