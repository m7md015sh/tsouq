// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
   required this.success,
    required this.category,
  });

  bool success;
  List<MyCategory> category;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    success: json["success"],
    category: List<MyCategory>.from(json["category"].map((x) => MyCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class MyCategory {
  MyCategory({
    required this.id,
    required  this.name,
    required  this.imageUrl,
      this.v,
  });

  String id;
  String name;
  String imageUrl;
  int? v;

  factory MyCategory.fromJson(Map<String, dynamic> json) => MyCategory(
    id: json["_id"],
    name: json["name"],
    imageUrl: json["image_url"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image_url": imageUrl,
    "__v": v == null ? null : v,
  };
}
