class ProductModel {
  final int count;
  final int price;
  final String productImages;
  final String categoryId;
  final String productId;
  final String productName;
  final String description;
  final String createdAt;
  final String currency;

  ProductModel({
    required this.count,
    required this.price,
    required this.productImages,
    required this.categoryId,
    required this.productId,
    required this.productName,
    required this.description,
    required this.createdAt,
    required this.currency,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      count: json['count'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      productImages: json['productImages'] as String? ?? "",
      categoryId: json['categoryId'] as String? ?? "",
      productId: json['productId'] as String? ?? "",
      productName: json['productName'] as String? ?? "",
      description: json['description'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      currency: json['currency'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'price': price,
      'productImages': productImages,
      'categoryId': categoryId,
      'prosuctId': productId,
      'productName': productName,
      'description': description,
      'createdAt': createdAt,
      'currency': currency,
    };
  }
}
