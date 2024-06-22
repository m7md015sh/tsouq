// // // To parse this JSON data, do
// // //
// // //     final favRequestModel = favRequestModelFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // FavRequestModel favRequestModelFromJson(String str) => FavRequestModel.fromJson(json.decode(str));
// //
// // String favRequestModelToJson(FavRequestModel data) => json.encode(data.toJson());
// //
// // class FavRequestModel {
// //   FavRequestModel({
// //     required this.success,
// //     required this.favourite,
// //   });
// //
// //   bool success;
// //   FavouriteReq favourite;
// //
// //   factory FavRequestModel.fromJson(Map<String, dynamic> json) => FavRequestModel(
// //     success: json["success"],
// //     favourite: FavouriteReq.fromJson(json["favourite"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "success": success,
// //     "favourite": favourite.toJson(),
// //   };
// // }
// //
// // class FavouriteReq {
// //   FavouriteReq({
// //     required  this.index,
// //     required this.views,
// //     required  this.name,
// //     required  this.type,
// //     required this.description,
// //     required  this.info,
// //     required  this.images,
// //     required  this.category,
// //     required  this.reviews,
// //     required   this.price,
// //     required  this.oldPrice,
// //     required  this.discount,
// //     required   this.ratings,
// //     required   this.seller,
// //     required   this.stock,
// //     required  this.numOfReviews,
// //     required this.product,
// //     required   this.user,
// //     required this.createdAt,
// //     required  this.by,
// //     required   this.id,
// //     required    this.addedAt,
// //     required this.v,
// //   });
// //
// //   int index;
// //   int views;
// //   String name;
// //   String type;
// //   String description;
// //   String info;
// //   List<ImageFav> images;
// //   String category;
// //   List<dynamic> reviews;
// //   int price;
// //   int oldPrice;
// //   int discount;
// //   int ratings;
// //   String seller;
// //   int stock;
// //   int numOfReviews;
// //   String product;
// //   String user;
// //   DateTime createdAt;
// //   String by;
// //   String id;
// //   DateTime addedAt;
// //   int v;
// //
// //   factory FavouriteReq.fromJson(Map<String, dynamic> json) => FavouriteReq(
// //     index: json["index"],
// //     views: json["views"],
// //     name: json["name"],
// //     type: json["type"],
// //     description: json["description"],
// //     info: json["info"],
// //     images: List<ImageFav>.from(json["images"].map((x) => ImageFav.fromJson(x))),
// //     category: json["category"],
// //     reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
// //     price: json["price"],
// //     oldPrice: json["oldPrice"],
// //     discount: json["discount"],
// //     ratings: json["ratings"],
// //     seller: json["seller"],
// //     stock: json["stock"],
// //     numOfReviews: json["numOfReviews"],
// //     product: json["product"],
// //     user: json["user"],
// //     createdAt: DateTime.parse(json["createdAT"]),
// //     by: json["by"],
// //     id: json["_id"],
// //     addedAt: DateTime.parse(json["addedAT"]),
// //     v: json["__v"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "index": index,
// //     "views": views,
// //     "name": name,
// //     "type": type,
// //     "description": description,
// //     "info": info,
// //     "images": List<dynamic>.from(images.map((x) => x.toJson())),
// //     "category": category,
// //     "reviews": List<dynamic>.from(reviews.map((x) => x)),
// //     "price": price,
// //     "oldPrice": oldPrice,
// //     "discount": discount,
// //     "ratings": ratings,
// //     "seller": seller,
// //     "stock": stock,
// //     "numOfReviews": numOfReviews,
// //     "product": product,
// //     "user": user,
// //     "createdAT": createdAt.toIso8601String(),
// //     "by": by,
// //     "_id": id,
// //     "addedAT": addedAt.toIso8601String(),
// //     "__v": v,
// //   };
// // }
// //
// // class ImageFav {
// //   ImageFav({
// //    required this.publicId,
// //     required this.url,
// //     required  this.id,
// //   });
// //
// //   String publicId;
// //   String url;
// //   String id;
// //
// //   factory ImageFav.fromJson(Map<String, dynamic> json) => ImageFav(
// //     publicId: json["public_id"],
// //     url: json["url"],
// //     id: json["_id"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "public_id": publicId,
// //     "url": url,
// //     "_id": id,
// //   };
// // }
// // To parse this JSON data, do
// //
// //     final postFavoModel = postFavoModelFromJson(jsonString);
//
// import 'dart:convert';
//
// PostFavoModel postFavoModelFromJson(String str) => PostFavoModel.fromJson(json.decode(str));
//
// String postFavoModelToJson(PostFavoModel data) => json.encode(data.toJson());
//
// class PostFavoModel {
//   PostFavoModel({
//   required  this.product,
//     required  this.views,
//     required  this.index,
//     required  this.name,
//     required  this.info,
//     required  this.type,
//     required  this.description,
//     required  this.price,
//     required this.seller,
//     required  this.stock,
//     required  this.ratings,
//     required  this.numOfReviews,
//     required this.images,
//     required  this.category,
//     required this.user,
//     required this.reviews,
//     required this.createdAt,
//     required this.discount,
//     required this.oldPrice,
//   });
//
//   String product;
//   int views;
//   int index;
//   String name;
//   String info;
//   String type;
//   String description;
//   int price;
//   String seller;
//   int stock;
//   int ratings;
//   int numOfReviews;
//   List<Image> images;
//   String category;
//   String user;
//   List<dynamic> reviews;
//   DateTime createdAt;
//   int discount;
//   int oldPrice;
//
//   factory PostFavoModel.fromJson(Map<String, dynamic> json) => PostFavoModel(
//     product: json["product"],
//     views: json["views"],
//     index: json["index"],
//     name: json["name"],
//     info: json["info"],
//     type: json["type"],
//     description: json["description"],
//     price: json["price"],
//     seller: json["seller"],
//     stock: json["stock"],
//     ratings: json["ratings"],
//     numOfReviews: json["numOfReviews"],
//     images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//     category: json["category"],
//     user: json["user"],
//     reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
//     createdAt: DateTime.parse(json["createdAT"]),
//     discount: json["discount"],
//     oldPrice: json["oldPrice"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product": product,
//     "views": views,
//     "index": index,
//     "name": name,
//     "info": info,
//     "type": type,
//     "description": description,
//     "price": price,
//     "seller": seller,
//     "stock": stock,
//     "ratings": ratings,
//     "numOfReviews": numOfReviews,
//     "images": List<dynamic>.from(images.map((x) => x.toJson())),
//     "category": category,
//     "user": user,
//     "reviews": List<dynamic>.from(reviews.map((x) => x)),
//     "createdAT": createdAt.toIso8601String(),
//     "discount": discount,
//     "oldPrice": oldPrice,
//   };
// }
//
// class Image {
//   Image({
//     required  this.publicId,
//     required this.url,
//     required  this.id,
//   });
//
//   String publicId;
//   String url;
//   String id;
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//     publicId: json["public_id"],
//     url: json["url"],
//     id: json["_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "public_id": publicId,
//     "url": url,
//     "_id": id,
//   };
// }
// To parse this JSON data, do
//
//     final postFavResoonseModel = postFavResoonseModelFromJson(jsonString);





import 'dart:convert';

PostFavResoonseModel postFavResoonseModelFromJson(String str) => PostFavResoonseModel.fromJson(json.decode(str));

String postFavResoonseModelToJson(PostFavResoonseModel data) => json.encode(data.toJson());

class PostFavResoonseModel {
  PostFavResoonseModel({
  required  this.success,
    required  this.favourite,
  });

  bool success;
  Favourite favourite;

  factory PostFavResoonseModel.fromJson(Map<String, dynamic> json) => PostFavResoonseModel(
    success: json["success"],
    favourite: Favourite.fromJson(json["favourite"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "favourite": favourite.toJson(),
  };
}

class Favourite {
  Favourite({
    required   this.index,
    required  this.views,
    required  this.name,
    required  this.type,
    required  this.description,
    required  this.info,
    required  this.images,
    required  this.category,
    required this.reviews,
    required  this.price,
    required  this.oldPrice,
    required  this.discount,
    required  this.ratings,
    required this.seller,
    required  this.stock,
    required this.numOfReviews,
    required  this.product,
    required this.user,
    required this.createdAt,
    required this.by,
    required  this.id,
    required  this.addedAt,
    required  this.v,
  });

  int index;
  int views;
  String name;
  String type;
  String description;
  String info;
  List<Image> images;
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
  String id;
  DateTime addedAt;
  int v;

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
    index: json["index"],
    views: json["views"],
    name: json["name"],
    type: json["type"],
    description: json["description"],
    info: json["info"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
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
    id: json["_id"],
    addedAt: DateTime.parse(json["addedAT"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
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
    "_id": id,
    "addedAT": addedAt.toIso8601String(),
    "__v": v,
  };
}

class Image {
  Image({
    required this.publicId,
    required this.url,
    required this.id,
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
