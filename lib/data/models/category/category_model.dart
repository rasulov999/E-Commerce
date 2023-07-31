class CategoryModel {
  final String categoryId;
  final String categoryName;
  final String description;
  final String imageUrl;
  final String createdAt;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'] as String? ?? "",
      categoryName: json['categoryName'] as String? ?? "",
      description: json['description'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt
    };
  }
}
