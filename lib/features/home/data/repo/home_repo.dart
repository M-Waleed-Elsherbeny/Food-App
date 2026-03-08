import 'package:dartz/dartz.dart';
import 'package:food_app/core/constants/api_constants.dart';
import 'package:food_app/core/services/api_services.dart';
import 'package:food_app/features/home/data/models/categories_model.dart';

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
}
