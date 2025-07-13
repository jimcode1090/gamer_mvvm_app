import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String email;
  String username;
  String password;

  UserModel({
    this.id = "",
    this.email = "",
    this.username = "",
    this.password = "",
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] ?? "",
    email: json["email"] ?? "",
    username: json["username"] ?? "",
    password: json["password"] ?? "",
  );

  /// ✅ Nueva versión de toJson con opción para excluir password
  Map<String, dynamic> toJson({bool includePassword = true, bool includeId = true}) {
    final data = {
      "email": email,
      "username": username,
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
