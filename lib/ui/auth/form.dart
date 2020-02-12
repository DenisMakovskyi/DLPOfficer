import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dlp_officer/ui/auth/bloc/bloc.dart';
import 'package:dlp_officer/ui/auth/bloc/event.dart';
import 'package:dlp_officer/ui/auth/bloc/state.dart';
import 'package:dlp_officer/domain/repositories/auth_repository.dart';

class AuthForm extends StatefulWidget {
  final AuthRepository _authRepository;

  AuthForm({Key key, @required AuthRepository authRepository})
      : assert(authRepository != null), _authRepository = authRepository,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthBloc _authBloc;

  AuthRepository get _authRespository => widget._authRepository;

  bool get isPopulated => _nameController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isSuccess) {

        }
        //-
        if (state.isFailure) {
        }
        //-
        if (state.isSubmitting) {
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(25.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  )
                ],
              ),
            )
          );
        }
      )
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool isAuthButtonEnabled(AuthState state) {
    return !state.isSubmitting && state.isFormValid && isPopulated;
  }

  void _onPasswordChanged() {
    _authBloc.add(
      AuthPasswordChanged(password: _passwordController.text),
    );
  }
}
