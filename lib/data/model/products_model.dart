// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    required this.success,
    required this.products,
  });

  bool success;
  Products products;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    success: json["success"],
    products: Products.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "products": products.toJson(),
  };
}

class Products {
  Products({
    required  this.allProducts,
    required  this.carousel,
    required this.topRatedProducts,
    required this.hotProducts,
    required  this.newestProducts,
  });

  List<Product> allProducts;
  List<Carousel> carousel;
  List<Product> topRatedProducts;
  List<Product> hotProducts;
  List<Product> newestProducts;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    allProducts: List<Product>.from(json["allProducts"].map((x) => Product.fromJson(x))),
    carousel: List<Carousel>.from(json["carousel"].map((x) => Carousel.fromJson(x))),
    topRatedProducts: List<Product>.from(json["topRatedProducts"].map((x) => Product.fromJson(x))),
    hotProducts: List<Product>.from(json["hotProducts"].map((x) => Product.fromJson(x))),
    newestProducts: List<Product>.from(json["newestProducts"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "allProducts": List<dynamic>.from(allProducts.map((x) => x.toJson())),
    "carousel": List<dynamic>.from(carousel.map((x) => x.toJson())),
    "topRatedProducts": List<dynamic>.from(topRatedProducts.map((x) => x.toJson())),
    "hotProducts": List<dynamic>.from(hotProducts.map((x) => x.toJson())),
    "newestProducts": List<dynamic>.from(newestProducts.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    required this.id,
    required  this.name,
    required  this.price,
    required  this.description,
    required  this.info,
    required  this.ratings,
    required  this.images,
    required  this.category,
    this.type,
    this.seller,
    required  this.stock,
    required  this.numOfReviews,
    this.user,
    required  this.reviews,
    required  this.createdAt,
    required  this.v,
    required  this.index,
    required  this.discount,
    required  this.oldPrice,
    required  this.views,
  });

  String id;
  String name;
  int price;
  String description;
  String info;
  int ratings;
  List<ImageProduct> images;
  String category;
  Type? type;
  Seller? seller;
  int stock;
  int numOfReviews;
  User? user;
  List<Review> reviews;
  DateTime createdAt;
  int v;
  int index;
  int discount;
  int oldPrice;
  int views;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    info: json["info"],
    ratings: json["ratings"],
    images: List<ImageProduct>.from(json["images"].map((x) => ImageProduct.fromJson(x))),
    category: json["category"],
    type: typeValues.map[json["type"]],
    seller: sellerValues.map[json["seller"]],
    stock: json["stock"],
    numOfReviews: json["numOfReviews"],
    user: userValues.map[json["user"]],
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    createdAt: DateTime.parse(json["createdAT"]),
    v: json["__v"],
    index: json["index"],
    discount: json["discount"],
    oldPrice: json["oldPrice"],
    views: json["views"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "price": price,
    "description": description,
    "info": info,
    "ratings": ratings,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "category": categoryValues.reverse[category],
    "type": typeValues.reverse[type],
    "seller": sellerValues.reverse[seller],
    "stock": stock,
    "numOfReviews": numOfReviews,
    "user": userValues.reverse[user],
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "createdAT": createdAt.toIso8601String(),
    "__v": v,
    "index": index,
    "discount": discount,
    "oldPrice": oldPrice,
    "views": views,
  };
}

enum Category { SHOES, CLOTHES, WATCHES, ELECTRONICS, LADIES, GAMES }

final categoryValues = EnumValues({
  "Clothes": Category.CLOTHES,
  "Electronics": Category.ELECTRONICS,
  "Games": Category.GAMES,
  "Ladies": Category.LADIES,
  "Shoes": Category.SHOES,
  "Watches": Category.WATCHES
});

class Carousel {
  Carousel({
    required  this.publicId,
    required this.url,
    required this.id,
  });

  String publicId;
  String url;
  String id;

  factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
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
class ImageProduct {
  ImageProduct({
    required  this.publicId,
    required this.url,
    required this.id,
  });

  String publicId;
  String url;
  String id;

  factory ImageProduct.fromJson(Map<String, dynamic> json) => ImageProduct(
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
class Review {
  Review({
    required  this.name,
    required this.comment,
    required this.rating,
  });

  String name;
  String comment;
  int rating;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    name: json["name"],
    comment: json["comment"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "comment": comment,
    "rating": rating,
  };
}

enum Seller { TSOUQ }

final sellerValues = EnumValues({
  "Tsouq": Seller.TSOUQ
});

enum Type { TOP_RATED, NEW, HOT, ALL }

final typeValues = EnumValues({
  "all": Type.ALL,
  "hot": Type.HOT,
  "new": Type.NEW,
  "top rated": Type.TOP_RATED
});

enum User { THE_6204_D785_E474964_CAE76_CAF6, THE_62_BB238_FEB11_B375_EB4_BD09_E }

final userValues = EnumValues({
  "6204d785e474964cae76caf6": User.THE_6204_D785_E474964_CAE76_CAF6,
  "62bb238feb11b375eb4bd09e": User.THE_62_BB238_FEB11_B375_EB4_BD09_E
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
