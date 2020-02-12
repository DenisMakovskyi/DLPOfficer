import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSubmitted extends AuthEvent {
  final String username;
  final String password;

  const AuthSubmitted({
    @required this.username,
    @required this.password
  });

  @override
  List<Object> get props => [username, password];
}

//-

class AuthPasswordChanged extends AuthEvent {
  final String password;

  const AuthPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}
