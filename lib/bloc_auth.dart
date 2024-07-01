import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traning/bloc_auth_event.dart';
import 'package:traning/bloc_auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    //Event Handler
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  FutureOr<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // simulate a network call
      await Future.delayed(Duration(seconds: 2));
      if (event.username == 'user' && event.password == 'password') {
        emit(Authenticated(event.username));
      } else {
        emit(AuthError('Invalid Crendentials'));
      }
    } catch (e) {
      emit(AuthError('An Error occured'));
    }
  }

  FutureOr<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) {
    emit(Unauthenticated());
  }
}
