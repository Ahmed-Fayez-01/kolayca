

// class  AuthState{}

// class AuthInitial extends AuthState {}
// class SignInLoadingState extends AuthState {}
// class SignInSuccessState extends AuthState {}
// class SignInErrorState extends AuthState {
//   final String errorMessage;
//   SignInErrorState({required this.errorMessage});
// }


// class SginUpLoadingState extends AuthState {}
// class SginUpSuccessState extends AuthState {}
// class SginUpErrorState extends AuthState {
//   final String errorMessage;
//   SginUpErrorState({required this.errorMessage});
// }



enum AuthStatus { initial, authenticated, unauthenticated }

class AuthState {
  final AuthStatus status;
  final String name;

  AuthState({required this.status, this.name = ''});

  AuthState copyWith({AuthStatus? status, String? name}) {
    return AuthState(
      status: status ?? this.status,
      name: name ?? this.name,
    );
  }
}