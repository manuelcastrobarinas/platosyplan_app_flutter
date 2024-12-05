import 'dart:convert';

class LoginResponse {
  bool ok;
  String message;
  UserModel userModel;
  String token;

  LoginResponse({
    required this.ok,
    required this.message,
    required this.userModel,
    required this.token,
  });

  factory LoginResponse.fromRawJson(String str) => LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    ok        : json["ok"],
    message   : json["message"],
    userModel : UserModel.fromJson(json["user"]),
    token     : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "message": message,
    "user": userModel.toJson(),
    "token": token,
  };
}

class UserModel {
  String id;
  String name;
  String email;
  String phone;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
    updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "CreatedAt": createdAt?.toIso8601String(),
    "UpdatedAt": updatedAt?.toIso8601String(),
  };
}
