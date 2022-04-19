// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.user,
    this.token,
    this.success,
    this.message,
  });

  User? user;
  String? token;
  bool? success;
  String? message;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "token": token,
        "success": success,
        "message": message,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.providerName,
    this.providerId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic providerName;
  dynamic providerId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        providerName: json["provider_name"],
        providerId: json["provider_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "provider_name": providerName,
        "provider_id": providerId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
