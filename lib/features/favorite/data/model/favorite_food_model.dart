import 'package:hive/hive.dart';

part 'favorite_food_model.g.dart';

@HiveType(typeId: 0)
class FavoriteFoodModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String area;
  @HiveField(4)
  final String category;

  FavoriteFoodModel({
    required this.id,
    required this.name,
    required this.image,
    required this.area,
    required this.category,
  });
}
