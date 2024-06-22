// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required  this.orderItems,
    required  this.shippingInfo,
    required  this.itemsPrice,
    required this.shippingPrice,
    required this.totalPrice,
    required this.orderStatus,
  });

  List<OrderItem> orderItems;
  ShippingInfo shippingInfo;
  double itemsPrice;
  int shippingPrice;
  double totalPrice;
  String orderStatus;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
    shippingInfo: ShippingInfo.fromJson(json["shippingInfo"]),
    itemsPrice: json["itemsPrice"].toDouble(),
    shippingPrice: json["shippingPrice"],
    totalPrice: json["totalPrice"].toDouble(),
    orderStatus: json["orderStatus"],
  );

  Map<String, dynamic> toJson() => {
    "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
    "shippingInfo": shippingInfo.toJson(),
    "itemsPrice": itemsPrice,
    "shippingPrice": shippingPrice,
    "totalPrice": totalPrice,
    "orderStatus": orderStatus,
  };
}

class OrderItem {
  OrderItem({
    required  this.product,
    required this.name,
    required  this.price,
    required  this.image,
    required  this.quantity,
  });

  String product;
  String name;
  double price;
  String image;
  int quantity;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    product: json["product"],
    name: json["name"],
    price: json["price"].toDouble(),
    image: json["image"],
    quantity:1,
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "name": name,
    "price": price,
    "image": image,
    "quantity": quantity,
  };
}

class ShippingInfo {
  ShippingInfo({
  required  this.name,
    required  this.address,
    required  this.phoneNo,
    required  this.state,
  });

  String name;
  String address;
  String phoneNo;
  String state;

  factory ShippingInfo.fromJson(Map<String, dynamic> json) => ShippingInfo(
    name: json["name"],
    address: json["address"],
    phoneNo: json["phoneNo"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "phoneNo": phoneNo,
    "state": state,
  };
}
