import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginButtonClickEvent>(authLoginButtonClickEvent);
    on<AuthLogoutButtonClickEvent>(authLogoutButtonClickEvent);
  }

  FutureOr<void> authLoginButtonClickEvent(
      AuthLoginButtonClickEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    try {
      final String password = event.password;
      if (password.length < 5) {
        emit(AuthFailureState("Password should be grater than 5"));
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthSuccessState());
        });
      }
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> authLogoutButtonClickEvent(
      AuthLogoutButtonClickEvent event, Emitter<AuthState> emit) {
    try {
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }
}
