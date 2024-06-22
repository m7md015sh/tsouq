import 'package:get/get.dart';
import 'package:tsouq/bindings/cart_binding.dart';
import 'package:tsouq/controller/products_controller.dart';


class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
    Get.lazyPut(() => CartBinding());

  }

}