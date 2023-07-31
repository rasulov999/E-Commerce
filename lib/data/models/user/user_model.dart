class UserModel {
  UserModel({
    required this.userId,
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt
  });
  final String userId;
  final String imageUrl;
  final String name;
  final String email;
  final DateTime createdAt;
  final String password;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      createdAt: json['createdAt'] as DateTime
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'imageUrl': imageUrl,
      'name': name,
      'email': email,
      'password': password,
      'createdAt' : createdAt,
    };
  }
}
