import 'package:get/get.dart';
import 'package:tsouq/controller/auth/auth_controller.dart';


  class AuthBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }

}