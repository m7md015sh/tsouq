// To parse this JSON data, do
//
//     final getFavModel = getFavModelFromJson(jsonString);

import 'dart:convert';

import 'fav_response_model.dart';

GetFavModel getFavModelFromJson(String str) => GetFavModel.fromJson(json.decode(str));

String getFavModelToJson(GetFavModel data) => json.encode(data.toJson());

class GetFavModel {
  GetFavModel({
    required  this.success,
    required this.favourites,
  });

  bool success;
  List<Favourite> favourites;

  factory GetFavModel.fromJson(Map<String, dynamic> json) => GetFavModel(
    success: json["success"],
    favourites: List<Favourite>.from(json["favourites"].map((x) => Favourite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "favourites": List<dynamic>.from(favourites.map((x) => x.toJson())),
  };
}

class GetFavourite {
  GetFavourite({
    required  this.id,
    required  this.index,
    required this.views,
    required  this.name,
    required  this.type,
    required   this.description,
    required   this.info,
    required this.images,
    required  this.category,
    required  this.reviews,
    required  this.price,
    required  this.oldPrice,
    required this.discount,
    required  this.ratings,
    required  this.seller,
    required  this.stock,
    required  this.numOfReviews,
    required  this.product,
    required  this.user,
    required  this.createdAt,
    required this.by,
    required  this.v,
    required this.addedAt,
  });

  String id;
  int index;
  int views;
  String name;
  String type;
  String description;
  String info;
  List<ImagesGet> images;
  String category;
  List<dynamic> reviews;
  int price;
  int oldPrice;
  int discount;
  int ratings;
  String seller;
  int stock;
  int numOfReviews;
  String product;
  String user;
  DateTime createdAt;
  String by;
  int v;
  DateTime addedAt;

  factory GetFavourite.fromJson(Map<String, dynamic> json) => GetFavourite(
    id: json["_id"],
    index: json["index"],
    views: json["views"],
    name: json["name"],
    type: json["type"],
    description: json["description"],
    info: json["info"],
    images: List<ImagesGet>.from(json["images"].map((x) => ImagesGet.fromJson(x))),
    category: json["category"],
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
    price: json["price"],
    oldPrice: json["oldPrice"],
    discount: json["discount"],
    ratings: json["ratings"],
    seller: json["seller"],
    stock: json["stock"],
    numOfReviews: json["numOfReviews"],
    product: json["product"],
    user: json["user"],
    createdAt: DateTime.parse(json["createdAT"]),
    by: json["by"],
    v: json["__v"],
    addedAt: DateTime.parse(json["addedAT"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "index": index,
    "views": views,
    "name": name,
    "type": type,
    "description": description,
    "info": info,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "category": category,
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "price": price,
    "oldPrice": oldPrice,
    "discount": discount,
    "ratings": ratings,
    "seller": seller,
    "stock": stock,
    "numOfReviews": numOfReviews,
    "product": product,
    "user": user,
    "createdAT": createdAt.toIso8601String(),
    "by": by,
    "__v": v,
    "addedAT": addedAt.toIso8601String(),
  };
}

class ImagesGet {
  ImagesGet({
   required this.publicId,
    required this.url,
    required  this.id,
  });

  String publicId;
  String url;
  String id;

  factory ImagesGet.fromJson(Map<String, dynamic> json) => ImagesGet(
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
