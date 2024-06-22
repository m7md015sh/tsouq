
import 'dart:convert';

RegisterModel resisterModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String resisterModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
   required this.success,
    required this.token,
    required  this.user,
  });

  bool success;
  String token;
  User user;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    success: json["success"],
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.name,
    required this.email,
    required  this.password,
     this.avatar,
     this.role,
      this.id,
     this.createdAt,
       this.v,
  });

  String name;
  String email;
  String password;
  Avatar? avatar;
  String? role;
  String? id;
  DateTime? createdAt;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    avatar: Avatar.fromJson(json["avatar"]),
    role: json["role"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAT"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "avatar": avatar?.toJson(),
    "role": role,
    "_id": id,
    "createdAT": createdAt?.toIso8601String(),
    "__v": v,
  };
}

class Avatar {
  Avatar({
    required this.publicId,
    required  this.url,
  });

  String publicId;
  String url;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    publicId: json["public_id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "public_id": publicId,
    "url": url,
  };
}
