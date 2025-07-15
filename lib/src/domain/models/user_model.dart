import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String email;
  String username;
  String image;
  String password;

  UserModel({
    this.id = "",
    this.email = "",
    this.username = "",
    this.password = "",
    this.image = ""
  });

  factory UserModel.fromJson(Map<String, dynamic> json, {String? id}) => UserModel(
    id: id ??json["id"] ?? "",
    email: json["email"] ?? "",
    username: json["username"] ?? "",
    password: json["password"] ?? "",
    image: json["image"] ?? "",
  );

  /// ✅ Nueva versión de toJson con opción para excluir password
  Map<String, dynamic> toJson({bool includePassword = true, bool includeId = true}) {
    final data = {
      "email": email,
      "username": username,
      "image": image
    };

    if (includeId) {
      data["id"] = id;
    }

    if (includePassword) {
      data["password"] = password;
    }

    return data;
  }
}
