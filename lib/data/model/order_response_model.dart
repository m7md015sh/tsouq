// To parse this JSON data, do
//
//     final orderResponseModel = orderResponseModelFromJson(jsonString);

import 'dart:convert';

OrderResponseModel orderResponseModelFromJson(String str) => OrderResponseModel.fromJson(json.decode(str));

String orderResponseModelToJson(OrderResponseModel data) => json.encode(data.toJson());

class OrderResponseModel {
  OrderResponseModel({
    required this.success,
    required  this.order,
  });

  bool success;
  Order order;

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) => OrderResponseModel(
    success: json["success"],
    order: Order.fromJson(json["order"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "order": order.toJson(),
  };
}

class Order {
  Order({
    required this.shippingInfo,
    required this.user,
    required  this.orderItems,
    required  this.itemsPrice,
    required  this.shippingPrice,
    required    this.totalPrice,
    required   this.orderStatus,
    required  this.paidAt,
    required  this.id,
    required  this.createdAt,
    required  this.v,
  });

  ShippingInfo shippingInfo;
  String user;
  List<OrderItems> orderItems;
  double itemsPrice;
  int shippingPrice;
  double totalPrice;
  String orderStatus;
  DateTime paidAt;
  String id;
  DateTime createdAt;
  int v;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    shippingInfo: ShippingInfo.fromJson(json["shippingInfo"]),
    user: json["user"],
    orderItems: List<OrderItems>.from(json["orderItems"].map((x) => OrderItems.fromJson(x))),
    itemsPrice: json["itemsPrice"].toDouble(),
    shippingPrice: json["shippingPrice"],
    totalPrice: json["totalPrice"].toDouble(),
    orderStatus: json["orderStatus"],
    paidAt: DateTime.parse(json["paidAt"]),
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "shippingInfo": shippingInfo.toJson(),
    "user": user,
    "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
    "itemsPrice": itemsPrice,
    "shippingPrice": shippingPrice,
    "totalPrice": totalPrice,
    "orderStatus": orderStatus,
    "paidAt": paidAt.toIso8601String(),
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "__v": v,
  };
}

class OrderItems {
  OrderItems({
    required   this.name,
    required  this.quantity,
    required this.price,
    required this.image,
    required this.product,
    required this.id,
  });

  String name;
  String quantity;
  double price;
  String image;
  String product;
  String id;

  factory OrderItems.fromJson(Map<String, dynamic> json) => OrderItems(
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
   required this.name,
    required this.phoneNo,
    required  this.state,
    required this.address,
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
