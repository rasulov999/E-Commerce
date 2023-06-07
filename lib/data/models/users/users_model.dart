import 'package:flutter_task/data/models/products/products_model.dart';

class UsersModel {
  UsersModel({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.orders,
  });
  final String id;
  final String name;
  final String imgUrl;
  final List<dynamic> orders;

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      orders: (json['orders'] as List)
          .map((e) => ProductsModel.fromJson(e))
          .toList(),
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      imgUrl: json['imgUrl'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "orders": orders,
      "id": id,
      "name": name,
      "imgUrl": imgUrl,
    };
  }
}
