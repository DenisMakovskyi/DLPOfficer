import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dlp_officer/strings.dart';
import 'package:dlp_officer/ui/auth/bloc/bloc.dart';
import 'package:dlp_officer/ui/auth/bloc/event.dart';
import 'package:dlp_officer/ui/auth/bloc/state.dart';
import 'package:dlp_officer/ui/splash/bloc/bloc.dart';
import 'package:dlp_officer/ui/splash/bloc/event.dart';

class AuthForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _nameController.addListener(_onCredentialsTyped);
    _passwordController.addListener(_onCredentialsTyped);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(listener: (context, state) {
      Scaffold.of(context).hideCurrentSnackBar();
      if (state.isSuccess) {
        BlocProvider.of<SplashBloc>(context).add(SplashEvent.AUTHENTICATED);
      }
      //-
      if (state.isFailure) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                title: Text(Strings.of(context).error),
                content: Text(Strings.of(context).requestError(state.code)),
                actions: <Widget>[
                  FlatButton(
                    child: Text(Strings.of(context).dialogActionClose),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
      //-
      if (state.isSubmitting) {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Strings.of(context).authSigningIn),
                  CircularProgressIndicator(
                    strokeWidth: 5.0,
                    backgroundColor: Colors.blueAccent,
                  )
                ]),
            backgroundColor: Colors.blueGrey.shade700));
      }
    }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Padding(
        padding:
            EdgeInsets.only(left: 25.0, top: 20.0, right: 25.0, bottom: 20.0),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 50.0),
                alignment: Alignment.center,
                child: Image.asset('assets/images/ic_splash.png',
                    width: 150.00, height: 150.0)),
            Expanded(
                child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 2.5),
                            alignment: Alignment.center,
                            child: TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.account_circle,
                                        color: Colors.blueAccent),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey.shade300,
                                            width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent, width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    labelText: Strings.of(context).authUsername),
                                keyboardType: TextInputType.text,
                                autocorrect: false,
                                autovalidate: false)),
                        Container(
                            margin: EdgeInsets.only(top: 2.5),
                            alignment: Alignment.center,
                            child: TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock,
                                        color: Colors.blueAccent),
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.remove_red_eye,
                                            color: Colors.blueAccent),
                                        onPressed: _onPasswordTogglePressed),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey.shade300,
                                            width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent, width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    labelText: Strings.of(context).authPassword),
                                obscureText: state.isPasswordObscured,
                                autocorrect: false,
                                autovalidate: false)),
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            color: Colors.blueAccent,
                            disabledColor: Colors.blueGrey.shade300,
                            elevation: 5.0,
                            child: Text(Strings.of(context).authSignIn,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.0)),
                            onPressed: state.isFormEnabled ? _submitForm : null,
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ))
          ],
        ),
      );
    }));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onCredentialsTyped() {
    _authBloc.add(CredentialsTyped(
        username: _nameController.text, password: _passwordController.text));
  }

  void _onPasswordTogglePressed() {
    _authBloc.add(PasswordTogglePressed());
  }

  void _submitForm() {
    _authBloc.add(AuthSubmitted(
        username: _nameController.text, password: _passwordController.text));
  }
}
