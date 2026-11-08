class CategoryModel {
  String name, image;

  CategoryModel.CategoryModel({required this.name, required this.image});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel.CategoryModel(
      name: json['category_name'] as String,
      image: json['category_image'] as String,
    );
  }
}
