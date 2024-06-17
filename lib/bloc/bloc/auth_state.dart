part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthActionState extends AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthActionState {}

final class AuthFailureState extends AuthActionState {
  final String error;

  AuthFailureState(this.error);
}
