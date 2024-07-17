

  



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolayca/features/auth/data/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(status: AuthStatus.unauthenticated));
  
  void createAccount(String name, String email, String password, String confirmPassword) {
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty && password == confirmPassword) {
      emit(state.copyWith(status: AuthStatus.authenticated, name: name));
    } else {
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }

  void logOut() {
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  void logIn(String name, String password) {
    if (name.isNotEmpty && password.isNotEmpty) {
      emit(state.copyWith(status: AuthStatus.authenticated, name: name));
    } else {
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }}