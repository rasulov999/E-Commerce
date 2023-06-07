class ProductsModel {
  final String id;
  final int count;
  final String name;
  final num price;
  final String imgUrl;

  ProductsModel({
    required this.id,
    required this.count,
    required this.name,
    required this.price,
    required this.imgUrl,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] as String? ?? "",
      count: json['count'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      price: json['price'] as num? ?? 0,
      imgUrl: json['imgUrl'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "count": count,
      "name": name,
      "price": price,
      "imgUrl": imgUrl,
    };
  }
}
