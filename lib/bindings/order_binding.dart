import 'package:get/get.dart';
import 'package:tsouq/controller/order_controller.dart';

class OrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController());
    // Get.put(CategoryController());
  }

}