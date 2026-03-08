class CategoriesModel {
  final String id, name, image, description;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['idCategory'],
      name: json['strCategory'],
      image: json['strCategoryThumb'],
      description: json['strCategoryDescription'],
    );
  }
}
