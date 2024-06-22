import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:tsouq/data/model/order_model.dart';
import 'package:tsouq/data/model/order_response_model.dart';
import 'package:tsouq/utils/app_constants.dart';
 //var client=http.Client();


 class AddOrder{
Future<dynamic>post({required List<dynamic>orderItems,required String name,required String address,required String phone,required String state,required double itemsPrice,required double shippingPrice,required double totalPrice,required String orderStatus})async{
  var token =AppConstants.TOKEN;
  Map<String,String> headers={};
  if(token!=null){
    headers.addAll({
      'Cookie':'token=$token',
      "Content-Type":"application/json",
    });
  }
  http.Response response=await http.post(Uri.parse('${AppConstants.BASE_URL}/api/v1/order/new'),body: json.encode({
    "orderItems": orderItems,
    "shippingInfo": {
      "name": name,
      "address": address,
      "phoneNo": phone,
      "state": state!=null?state:"null",
    },
    "itemsPrice": itemsPrice,
    "shippingPrice": 20,
    "totalPrice": totalPrice,
    "orderStatus": orderStatus,
  }),headers: headers);
  //Map<String,dynamic> data=jsonDecode(response.body);
  if(response.statusCode==200)
  {
    var stringObject=response.body;
    var data=orderResponseModelFromJson(stringObject);
    print(data.order.orderStatus);
    return data;

  }else {
    return throw Exception("Failed to load product");


  }

}

//   makeOrder()async{
//     var response=await  post(url: 'https://emey-api.herokuapp.com/api/v1/order/new',body: json.encode({
//     "orderItems": orderItems,
//     "shippingInfo": {
//       "name": name,
//       "address": address,
//       "phoneNo": phone,
//       "state": state
//     },
//     "itemsPrice": itemsPrice,
//     "shippingPrice": 20,
//     "totalPrice": totalPrice,
//     "orderStatus": orderStatus,
//   }),token: AppConstants.TOKEN );
//
//
//   }
 }