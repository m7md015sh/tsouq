import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tsouq/data/model/get_my_orders_model.dart';

import '../core/services/get_my_orders_services.dart';

class AllOrdersController extends GetxController{
  var isLoading_my_orders=true.obs;
  var allOrderList =<MyOrders>[].obs;

  var isProcessing=false.obs;
  var isShipping=false.obs;
  var isDelivered=false.obs;

  @override
  void onInit() {
    getMyOrders();

    super.onInit();
  }

  void track(int index){
    if(allOrderList[index].orderStatus=="processing"){
      isProcessing.value=true;
      isShipping.value=false;
      isDelivered.value=false;
    }else if(allOrderList[index].orderStatus=="Shipping"){
      isProcessing.value=true;
      isShipping.value=true;
      isDelivered.value=false;
    }else if(allOrderList[index].orderStatus=="Delivered"){
      isProcessing.value=true;
      isShipping.value=true;
      isDelivered.value=true;

    }
  }
  Future getMyOrders()async{
    var orders= await GetMyOrdersService.getMyOrders();
    // print(product.length);

    try{
      isLoading_my_orders.value=true;
      if(orders.order.isNotEmpty){
        allOrderList.addAll(orders.order);
      }
    }finally{

      isLoading_my_orders.value=false;



    }
  }

}