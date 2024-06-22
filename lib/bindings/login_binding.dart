import 'package:get/get.dart';
import 'package:tsouq/controller/auth/auth_controller.dart';
import 'package:tsouq/controller/auth/login_controller.dart';
import 'package:tsouq/controller/auth/register_controller.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());

  }

}