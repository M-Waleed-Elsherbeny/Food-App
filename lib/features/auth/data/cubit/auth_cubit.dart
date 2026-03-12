import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/auth/data/cubit/auth_state.dart';
import 'package:food_app/features/auth/data/repo/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitialState());
  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());
    final res = await authRepo.login(email: email, password: password);
    res.fold(
      (l) => emit(AuthErrorState(errMsg: l)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    final res = await authRepo.signUp(
      name: name,
      email: email,
      password: password,
    );
    res.fold(
      (l) => emit(AuthErrorState(errMsg: l)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> logout() async {
    emit(AuthLoadingState());
    final res = await authRepo.logout();
    res.fold(
      (l) => emit(AuthErrorState(errMsg: l)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> saveUser({required String name, required String email}) async {
    emit(AuthLoadingState());
    final res = await authRepo.saveUser(name: name, email: email);
    res.fold(
      (l) => emit(AuthErrorState(errMsg: l)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> getUser() async {
    emit(GetUserLoadingState());
    final res = await authRepo.getUser();
    res.fold((error) => emit(GetUserErrorState(errMsg: error)), (user) {
      emit(GetUserSuccessState(name: user["name"], email: user["email"]));
    });
  }
}
