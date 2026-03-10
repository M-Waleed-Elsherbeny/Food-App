import 'package:food_app/features/home/data/models/categories_model.dart';
import 'package:food_app/features/home/data/models/meals_model.dart';
import 'package:food_app/features/meals_details/data/model/meals_details_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class GetCategoriesLoadingState extends HomeState {}

class GetCategoriesSuccessState extends HomeState {
  final List<CategoriesModel> categories;

  GetCategoriesSuccessState(this.categories);
}

class GetCategoriesErrorState extends HomeState {
  final String error;

  GetCategoriesErrorState(this.error);
}

class GetMealsLoadingState extends HomeState {}

class GetMealsSuccessState extends HomeState {
  final List<MealsModel> meals;

  GetMealsSuccessState(this.meals);
}

class GetMealsErrorState extends HomeState {
  final String error;

  GetMealsErrorState(this.error);
}

class GetMealsDetailsLoadingState extends HomeState {}

class GetMealsDetailsSuccessState extends HomeState {
  final List<MealsDetailsModel> meals;

  GetMealsDetailsSuccessState(this.meals);
}

class GetMealsDetailsErrorState extends HomeState {
  final String error;

  GetMealsDetailsErrorState(this.error);
}
