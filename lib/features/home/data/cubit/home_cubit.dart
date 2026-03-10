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

  Future<void> getMeals({required String catTitle}) async {
    emit(GetMealsLoadingState());
    final response = await homeRepo.getMeals(catTitle: catTitle);
    response.fold(
      (error) => emit(GetMealsErrorState(error)),
      (meals) => emit(GetMealsSuccessState(meals)),
    );
  }
  Future<void> getMealDetails({required String id}) async {
    emit(GetMealsDetailsLoadingState());
    final response = await homeRepo.getMealsDetails(id: id);
    response.fold(
      (error) => emit(GetMealsDetailsErrorState(error)),
      (meals) => emit(GetMealsDetailsSuccessState(meals)),
    );
  }
}
