import 'package:meta/meta.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:dlp_officer/strings.dart';
import 'package:dlp_officer/orientation.dart';
import 'package:dlp_officer/di/modules.dart';
import 'package:dlp_officer/di/injector.dart';
import 'package:dlp_officer/ui/auth/screen.dart';
import 'package:dlp_officer/ui/splash/screen.dart';
import 'package:dlp_officer/ui/splash/bloc/bloc.dart';
import 'package:dlp_officer/ui/splash/bloc/event.dart';
import 'package:dlp_officer/ui/splash/bloc/state.dart';
import 'package:dlp_officer/domain/repositories/auth_repository.dart';

void mainDelegate() async {
  var component = await AppComponent.create(
      PreferencesModule(), ApiModule(), RepositoriesModule());
  runApp(BlocProvider(
    create: (context) =>
        SplashBloc(authPreferences: component.getAuthPreferences())
          ..add(SplashEvent.STARTED),
    child: Application(authRepository: component.getAuthRepository()),
  ));
}

class Application extends StatelessWidget with PortraitStatelessWidget {
  final AuthRepository _authRepository;

  const Application({Key key, @required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
        onTap: () {
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
            localizationsDelegates: [
              StringsDelegate(),
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate
            ],
            supportedLocales: [
              Locale('en'),
              Locale('uk'),
              Locale('ru')
            ],
            home:
                BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
              switch (state) {
                case SplashState.INITIAL:
                  return SplashScreen();
                case SplashState.AUTHENTICATED:
                  return SplashScreen();
                case SplashState.UNAUTHENTICATED:
                  return AuthScreen(authRepository: _authRepository);
              }
              return SplashScreen();
            })));
  }
}
