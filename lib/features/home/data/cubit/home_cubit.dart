import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/data/cubit/home_state.dart';
import 'package:food_app/features/home/data/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitialState());

  Future<void> getCategories() async {
    emit(GetCategoriesLoadingState());
    final response = await homeRepo.getCategories();
    response.fold(
      (error) => emit(GetCategoriesErrorState(error)),
      (categories) => emit(GetCategoriesSuccessState(categories)),
    );
  }
}
