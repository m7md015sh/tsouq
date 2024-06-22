// To parse this JSON data, do
//
//     final singleProductModel = singleProductModelFromJson(jsonString);

import 'dart:convert';

SingleProductModel singleProductModelFromJson(String str) => SingleProductModel.fromJson(json.decode(str));

String singleProductModelToJson(SingleProductModel data) => json.encode(data.toJson());

class SingleProductModel {
  SingleProductModel({
    required this.success,
    required this.product,
  });

  bool success;
  Product product;

  factory SingleProductModel.fromJson(Map<String, dynamic> json) => SingleProductModel(
    success: json["success"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "product": product.toJson(),
  };
}

class Product {
  Product({
   required this.id,
    required this.name,
    required this.price,
    required  this.description,
    required this.info,
    required  this.ratings,
    required   this.images,
    required  this.category,
    required  this.type,
    required  this.seller,
    required  this.stock,
    required  this.numOfReviews,
    required  this.user,
    required  this.reviews,
    required  this.createdAt,
    required  this.v,
    required  this.productCreatedAt,
  });

  String id;
  String name;
  int price;
  String description;
  String info;
  int ratings;
  List<Image> images;
  String category;
  String type;
  String seller;
  int stock;
  int numOfReviews;
  String user;
  List<dynamic> reviews;
  DateTime createdAt;
  int v;
  DateTime productCreatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    info: json["info"],
    ratings: json["ratings"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    category: json["category"],
    type: json["type"],
    seller: json["seller"],
    stock: json["stock"],
    numOfReviews: json["numOfReviews"],
    user: json["user"],
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAT"]),
    v: json["__v"],
    productCreatedAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "price": price,
    "description": description,
    "info": info,
    "ratings": ratings,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "category": category,
    "type": type,
    "seller": seller,
    "stock": stock,
    "numOfReviews": numOfReviews,
    "user": user,
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "createdAT": createdAt.toIso8601String(),
    "__v": v,
    "createdAt": productCreatedAt.toIso8601String(),
  };
}

class Image {
  Image({
    required this.publicId,
    required this.url,
    required  this.id,
  });

  String publicId;
  String url;
  String id;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    publicId: json["public_id"],
    url: json["url"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "public_id": publicId,
    "url": url,
    "_id": id,
  };
}
