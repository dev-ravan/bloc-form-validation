part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthLoginButtonClickEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginButtonClickEvent({required this.email, required this.password});
}

class AuthLogoutButtonClickEvent extends AuthEvent {}
