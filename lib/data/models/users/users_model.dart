class UsersModel {
  UsersModel({
    required this.id,
    required this.imgUrl,
    required this.name,
  });
  final String id;
  final String name;
  final String imgUrl;

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      imgUrl: json['imgUrl'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "imgUrl": imgUrl,
    };
  }
}
