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

    List<User> ? user;
    String ? token;
    bool ? success;
    String ? message;

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        user: json["user"] == null ? null : List<User>.from(json["user"].map((x) => User.fromJson(x))),
        token: json["token"] == null ? null : json["token"],
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "user": user == null ? null : List<dynamic>.from(user!.map((x) => x.toJson())),
        "token": token == null ? null : token,
        "success": success == null ? null : success,
        "message": message == null ? null : message,
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

    int ? id;
    String ? name;
    String ?email;
    dynamic emailVerifiedAt;
    dynamic providerName;
    dynamic providerId;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        providerName: json["provider_name"],
        providerId: json["provider_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id! == null ? null : id,
        "name": name! == null ? null : name,
        "email": email! == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "provider_name": providerName,
        "provider_id": providerId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}
