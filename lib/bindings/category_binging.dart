
import 'package:get/get.dart';
import 'package:tsouq/controller/products_controller.dart';


class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductsController());
  }

}