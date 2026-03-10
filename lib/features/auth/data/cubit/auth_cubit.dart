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

  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoadingState());
    final res = await authRepo.signUp(email: email, password: password);
    res.fold(
      (l) => emit(AuthErrorState(errMsg: l)),
      (r) => emit(AuthSuccessState()),
    );
  }
}
