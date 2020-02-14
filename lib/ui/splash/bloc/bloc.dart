import 'dart:io';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:dlp_officer/ui/splash/bloc/event.dart';
import 'package:dlp_officer/ui/splash/bloc/state.dart';
import 'package:dlp_officer/data/preferences/preferences.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthPreferences _authPreferences;

  SplashBloc({@required AuthPreferences authPreferences})
      : assert(authPreferences != null),
        _authPreferences = authPreferences;

  @override
  SplashState get initialState => SplashState.INITIAL;

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event == SplashEvent.STARTED) {
      yield SplashState.INITIAL;
      final hasBasicAuth = await _authPreferences.hasBasicAuth();
      sleep(Duration(seconds: 1));
      if (hasBasicAuth) {
        yield SplashState.AUTHENTICATED;
      } else {
        yield SplashState.UNAUTHENTICATED;
      }
    } else if (event == SplashEvent.AUTHENTICATED) {
      yield SplashState.AUTHENTICATED;
    }
  }
}
