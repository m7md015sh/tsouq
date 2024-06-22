import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/cart_controller.dart';
import 'package:tsouq/core/services/get_my_orders_services.dart';
import 'package:tsouq/core/services/post_order.dart';
import 'package:tsouq/data/model/get_my_orders_model.dart';

import '../data/model/order_model.dart';
import '../data/model/products_model.dart';

class OrderController extends GetxController {
  var isLoading = false.obs;

  var isProcessing = false.obs;
  var isShipping = false.obs;
  var isDelivered = false.obs;

  var order;
  var order_model;
  var total;
  var totalAfterShopping;
  var orderList = <OrderItem>[].obs;
  late TextEditingController nameController,
      phoneController,
      addressController,
      stateController;
  String name = '', phone = '', address = '', state = '';
  var cartList = <dynamic>[].obs;

  final cartController = Get.find<CartController>();
  @override
  void onInit() {
    // getMyOrders();
    total = cartController.total;
    totalAfterShopping = cartController.totalAfterShopping;
    for (int i = 0; i < cartController.productsMap.length; i++) {
      cartList.add(cartController.productsMap.keys.toList()[i]);
    }
    for (int i = 0; i < cartController.productsMap.length; i++) {
      orderList.add(OrderItem(
          product: cartList[i].id,
          name: cartList[i].name,
          price: cartList[i].price.toDouble(),
          image: cartList[i].images[0].url,
          quantity: cartController.productsMap.values.toList()[i]));
    }

    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    stateController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    stateController.dispose();
    super.dispose();
  }

  doOrder() async {
    isLoading.value = true;

    try {
      var data = await AddOrder().post(
        orderItems: orderList,
        name: nameController.text,
        address: addressController.text,
        phone: phoneController.text,
        state: stateController.text,
        itemsPrice: double.parse(total.toString()),
        shippingPrice: 20,
        totalPrice: double.parse(totalAfterShopping.toString()),
        orderStatus: 'processing',
      );
      if (data != null) {
        order = data.order;
        //order_model=data;
        //allOrderList.addAll(order);

      } else {
        throw Exception('you have something error in order');
      }
    } finally {
      isLoading.value = false;

      if (order.orderStatus == "processing") {
        isProcessing.value = true;
        isShipping.value = false;
        isDelivered.value = false;
      } else if (order.orderStatus == "Shipping") {
        isProcessing.value = true;
        isShipping.value = true;
        isDelivered.value = false;
      } else if (order.orderStatus == "Delivered") {
        isProcessing.value = true;
        isShipping.value = true;
        isDelivered.value = true;
      }
      isLoading.value = false;
    }
  }
}
