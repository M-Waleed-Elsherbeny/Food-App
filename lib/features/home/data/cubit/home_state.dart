import 'package:food_app/features/home/data/models/categories_model.dart';

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
