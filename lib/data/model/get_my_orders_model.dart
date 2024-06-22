// // To parse this JSON data, do
// //
// //     final getMyOrdersModel = getMyOrdersModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetMyOrdersModel getMyOrdersModelFromJson(String str) => GetMyOrdersModel.fromJson(json.decode(str));
//
// String getMyOrdersModelToJson(GetMyOrdersModel data) => json.encode(data.toJson());
//
// class GetMyOrdersModel {
//   GetMyOrdersModel({
//     required    this.success,
//     required  this.order,
//   });
//
//   bool success;
//   List<MyOrders> order;
//
//   factory GetMyOrdersModel.fromJson(Map<String, dynamic> json) => GetMyOrdersModel(
//     success: json["success"],
//     order: List<MyOrders>.from(json["order"].map((x) => MyOrders.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "order": List<dynamic>.from(order.map((x) => x.toJson())),
//   };
// }
//
// class MyOrders {
//   MyOrders({
//     required  this.shippingInfo,
//     required this.id,
//     required this.user,
//     required  this.orderItems,
//     required  this.itemsPrice,
//     required  this.shippingPrice,
//     required this.totalPrice,
//     required this.orderStatus,
//     required  this.paidAt,
//     required this.createdAt,
//     required  this.v,
//   });
//
//   ShippingInfo shippingInfo;
//   String id;
//   User? user;
//   List<MyOrderItem> orderItems;
//   int itemsPrice;
//   int shippingPrice;
//   int totalPrice;
//   OrderStatus? orderStatus;
//   DateTime paidAt;
//   DateTime createdAt;
//   int v;
//
//   factory MyOrders.fromJson(Map<String, dynamic> json) => MyOrders(
//     shippingInfo: ShippingInfo.fromJson(json["shippingInfo"]),
//     id: json["_id"],
//     user: userValues.map[json["user"]],
//     orderItems: List<MyOrderItem>.from(json["orderItems"].map((x) => MyOrderItem.fromJson(x))),
//     itemsPrice: json["itemsPrice"],
//     shippingPrice: json["shippingPrice"],
//     totalPrice: json["totalPrice"],
//     orderStatus: orderStatusValues.map[json["orderStatus"]],
//     paidAt: DateTime.parse(json["paidAt"]),
//     createdAt: DateTime.parse(json["createdAt"]),
//     v: json["__v"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "shippingInfo": shippingInfo.toJson(),
//     "_id": id,
//     "user": userValues.reverse[user],
//     "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
//     "itemsPrice": itemsPrice,
//     "shippingPrice": shippingPrice,
//     "totalPrice": totalPrice,
//     "orderStatus": orderStatusValues.reverse[orderStatus],
//     "paidAt": paidAt.toIso8601String(),
//     "createdAt": createdAt.toIso8601String(),
//     "__v": v,
//   };
// }
//
// class MyOrderItem {
//   MyOrderItem({
//     required this.name,
//     required  this.quantity,
//     required  this.price,
//     required this.image,
//     required this.product,
//     required this.id,
//   });
//
//   String name;
//   String quantity;
//   int price;
//   String image;
//   String product;
//   String id;
//
//   factory MyOrderItem.fromJson(Map<String, dynamic> json) => MyOrderItem(
//     name: json["name"],
//     quantity: json["quantity"],
//     price: json["price"],
//     image: json["image"],
//     product: json["product"],
//     id: json["_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "quantity": quantity,
//     "price": price,
//     "image": image,
//     "product": product,
//     "_id": id,
//   };
// }
//
// enum OrderStatus { PROCESSING }
//
// final orderStatusValues = EnumValues({
//   "processing": OrderStatus.PROCESSING
// });
//
// class ShippingInfo {
//   ShippingInfo({
//    required this.name,
//     required this.phoneNo,
//     required this.state,
//     required  this.address,
//   });
//
//   String name;
//   String phoneNo;
//   String state;
//   String address;
//
//   factory ShippingInfo.fromJson(Map<String, dynamic> json) => ShippingInfo(
//     name: json["name"],
//     phoneNo: json["phoneNo"],
//     state: json["state"],
//     address: json["address"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "phoneNo": phoneNo,
//     "state": state,
//     "address": address,
//   };
// }
//
// enum User { THE_6204_D785_E474964_CAE76_CAF6 }
//
// final userValues = EnumValues({
//   "6204d785e474964cae76caf6": User.THE_6204_D785_E474964_CAE76_CAF6
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//  late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
// To parse this JSON data, do
//
//     final getMyOrdersModel = getMyOrdersModelFromJson(jsonString);

import 'dart:convert';

GetMyOrdersModel getMyOrdersModelFromJson(String str) => GetMyOrdersModel.fromJson(json.decode(str));

String getMyOrdersModelToJson(GetMyOrdersModel data) => json.encode(data.toJson());

class GetMyOrdersModel {
  GetMyOrdersModel({
    required   this.success,
    required this.order,
  });

  bool success;
  List<MyOrders> order;

  factory GetMyOrdersModel.fromJson(Map<String, dynamic> json) => GetMyOrdersModel(
    success: json["success"],
    order: List<MyOrders>.from(json["order"].map((x) => MyOrders.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "order": List<dynamic>.from(order.map((x) => x.toJson())),
  };
}

class MyOrders {
  MyOrders({
    required this.shippingInfo,
    required this.id,
    required   this.user,
    required  this.orderItems,
    required this.itemsPrice,
    required this.shippingPrice,
    required this.totalPrice,
    required this.orderStatus,
    required  this.paidAt,
    required  this.createdAt,
    required this.v,
    required   this.deliveredAt,
  });

  ShippingInfo shippingInfo;
  String id;
  String user;
  List<MyOrderItem> orderItems;
  double itemsPrice;
  int shippingPrice;
  double totalPrice;
  String orderStatus;
  DateTime paidAt;
  DateTime createdAt;
  int v;
  DateTime? deliveredAt;

  factory MyOrders.fromJson(Map<String, dynamic> json) => MyOrders(
    shippingInfo: ShippingInfo.fromJson(json["shippingInfo"]),
    id: json["_id"],
    user: json["user"],
    orderItems: List<MyOrderItem>.from(json["orderItems"].map((x) => MyOrderItem.fromJson(x))),
    itemsPrice: json["itemsPrice"].toDouble(),
    shippingPrice: json["shippingPrice"],
    totalPrice: json["totalPrice"].toDouble(),
    orderStatus: json["orderStatus"],
    paidAt: DateTime.parse(json["paidAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    v: json["__v"],
    deliveredAt: json["deliveredAt"] == null ? null : DateTime.parse(json["deliveredAt"]),
  );

  Map<String, dynamic> toJson() => {
    "shippingInfo": shippingInfo.toJson(),
    "_id": id,
    "user": user,
    "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
    "itemsPrice": itemsPrice,
    "shippingPrice": shippingPrice,
    "totalPrice": totalPrice,
    "orderStatus": orderStatus,
    "paidAt": paidAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "__v": v,
    "deliveredAt": deliveredAt == null ? null : deliveredAt!.toIso8601String(),
  };
}

class MyOrderItem {
  MyOrderItem({
    required  this.name,
    required  this.quantity,
    required  this.price,
    required this.image,
    required this.product,
    required  this.id,
  });

  String name;
  String quantity;
  double price;
  String image;
  String product;
  String id;

  factory MyOrderItem.fromJson(Map<String, dynamic> json) => MyOrderItem(
    name: json["name"],
    quantity: json["quantity"],
    price: json["price"].toDouble(),
    image: json["image"],
    product: json["product"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
    "price": price,
    "image": image,
    "product": product,
    "_id": id,
  };
}

class ShippingInfo {
  ShippingInfo({
  required  this.name,
    required  this.phoneNo,
    required  this.state,
    required  this.address,
  });

  String name;
  String phoneNo;
  String state;
  String address;

  factory ShippingInfo.fromJson(Map<String, dynamic> json) => ShippingInfo(
    name: json["name"],
    phoneNo: json["phoneNo"],
    state: json["state"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phoneNo": phoneNo,
    "state": state,
    "address": address,
  };
}
