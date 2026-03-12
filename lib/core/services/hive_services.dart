import 'dart:developer';

import 'package:food_app/features/favorite/data/model/favorite_food_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveServices {
  static const String favoriteBox = 'favoriteBox';

  static Future<Box> openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox<List>(boxName);
  }

  static Future<void> addFavorite(String userId, FavoriteFoodModel food) async {
    final box = Hive.box<List>(favoriteBox);

    List favorites = box.get(userId, defaultValue: [])!;

    favorites.add(food);
    log(favorites.toString());

    await box.put(userId, favorites);
  }

  static List<FavoriteFoodModel> getFavorites(String userId) {
    final box = Hive.box<List>(favoriteBox);

    List favorites = box.get(userId, defaultValue: [])!;
    log(favorites.toString());

    return favorites.cast<FavoriteFoodModel>();
  }

  static Future<void> removeFavorite(String userId, String foodId) async {
    final box = Hive.box<List>(favoriteBox);

    List favorites = box.get(userId, defaultValue: [])!;

    favorites.removeWhere((food) => food.id == foodId);

    await box.put(userId, favorites);
  }

  static bool isFavorite(String userId, String foodId) {
    final box = Hive.box<List>(favoriteBox);

    List favorites = box.get(userId, defaultValue: [])!;
    log(favorites.toString());

    return favorites.any((food) => food.id == foodId);
  }


}

