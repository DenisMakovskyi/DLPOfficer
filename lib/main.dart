import 'package:dlp_officer/ui/splash/screen.dart';
import 'package:meta/meta.dart';
import 'package:inject/inject.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dlp_officer/di/modules.dart';
import 'package:dlp_officer/di/injector.dart';
import 'package:dlp_officer/ui/splash/bloc/bloc.dart';
import 'package:dlp_officer/ui/splash/bloc/event.dart';
import 'package:dlp_officer/ui/splash/bloc/state.dart';
import 'package:dlp_officer/domain/repositories/auth_repository.dart';

void mainDelegate() async {
  var component = await AppComponent.create(
      PreferencesModule(),
      ApiModule(),
      RepositoriesModule());
  runApp(
    BlocProvider(
      create: (context) => SplashBloc(
          authPreferences: component.getAuthPreferences()
      )..add(SplashEvent.STARTED),
      child: Application(authRepository: component.getAuthRepository()),
    )
  );
}

@provide
class Application extends StatelessWidget {

  final AuthRepository _authRepository;

  Application({
    Key key,
    @required AuthRepository authRepository
  }) : assert(authRepository != null), _authRepository = authRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          switch(state) {
            case SplashState.INITIAL:
              return SplashScreen();
              break;
            case SplashState.AUTHENTICATED:
              // main screen here
              break;
            case SplashState.UNAUTHENTICATED:
              // auth screen here
              break;
          }
        }
      )
    );
  }
}
