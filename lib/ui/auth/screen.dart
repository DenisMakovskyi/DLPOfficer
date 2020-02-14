import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dlp_officer/ui/auth/form.dart';
import 'package:dlp_officer/ui/auth/bloc/bloc.dart';
import 'package:dlp_officer/domain/repositories/auth_repository.dart';

class AuthScreen extends StatelessWidget {
  final AuthRepository _authRepository;

  const AuthScreen({Key key, @required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository: _authRepository),
          child: AuthForm()),
    );
  }
}
