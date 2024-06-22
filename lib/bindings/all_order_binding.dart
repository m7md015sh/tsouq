import 'package:get/get.dart';
import 'package:tsouq/controller/all_orders_controller.dart';
import 'package:tsouq/controller/order_controller.dart';

class AllOrdersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AllOrdersController());
    // Get.put(CategoryController());
  }

}