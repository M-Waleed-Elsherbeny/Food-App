
abstract class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String errMsg;
  AuthErrorState({required this.errMsg});
}

final class AuthSuccessState extends AuthState {}
