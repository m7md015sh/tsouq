import 'package:get/get.dart';
import 'package:tsouq/controller/auth/auth_controller.dart';
import 'package:tsouq/controller/auth/register_controller.dart';


class RegisterBinding implements Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => RegisterController());
  }

}