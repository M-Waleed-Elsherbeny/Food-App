class MealsModel {
  final String id, title, image;

  MealsModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return MealsModel(
      id: json["idMeal"],
      title: json["strMeal"],
      image: json["strMealThumb"],
    );
  }
}
