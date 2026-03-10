import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:food_app/core/constants/api_constants.dart';
import 'package:food_app/core/services/api_services.dart';
import 'package:food_app/features/home/data/models/categories_model.dart';
import 'package:food_app/features/home/data/models/meals_model.dart';
import 'package:food_app/features/meals_details/data/model/meals_details_model.dart';

class HomeRepo {
  ApiServices apiServices = ApiServices();

  Future<Either<String, List<CategoriesModel>>> getCategories() async {
    try {
      final response = await apiServices.get(
        endPoint: ApiConstants.categoryEndpoint,
      );
      if (response.statusCode == 200) {
        List<CategoriesModel> categories = [];
        for (var category in response.data["categories"]) {
          categories.add(CategoriesModel.fromJson(category));
        }
        return Right(categories);
      } else {
        return const Left('Failed to load categories');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<MealsModel>>> getMeals({
    required String catTitle,
  }) async {
    try {
      final response = await apiServices.get(
        endPoint: "${ApiConstants.mealsEndpoint}?c=$catTitle",
      );
      if (response.statusCode == 200) {
        List<MealsModel> meals = [];
        for (var meal in response.data["meals"]) {
          meals.add(MealsModel.fromJson(meal));
        }
        return Right(meals);
      } else {
        log(response.data.toString());
        return const Left('Failed to load Meals');
      }
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, List<MealsDetailsModel>>> getMealsDetails({
    required String id,
  }) async {
    try {
      final res = await apiServices.get(
        endPoint: "${ApiConstants.mealsDetails}?i=$id",
      );
      if (res.statusCode == 200) {
        List<MealsDetailsModel> meals = [];
        for (var meal in res.data["meals"]) {
          meals.add(MealsDetailsModel.fromJson(meal));
        }
        return right(meals);
      } else {
        log(res.data.toString());
        return left("No Meals Founded");
      }
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }
}
