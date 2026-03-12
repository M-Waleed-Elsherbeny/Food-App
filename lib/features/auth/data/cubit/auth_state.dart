abstract class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String errMsg;
  AuthErrorState({required this.errMsg});
}

final class AuthSuccessState extends AuthState {}

final class GetUserLoadingState extends AuthState {}

final class GetUserErrorState extends AuthState {
  final String errMsg;
  GetUserErrorState({required this.errMsg});
}

final class GetUserSuccessState extends AuthState {
  final String name, email;
  GetUserSuccessState({required this.name, required this.email});
}
