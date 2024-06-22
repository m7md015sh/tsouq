import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/core/services/services_auth.dart';
import 'package:tsouq/data/model/auth_models/login_model.dart';

import 'auth_controller.dart';
class LoginController extends GetxController{
  var isLoading=false.obs;
  final loginFormKey=GlobalKey<FormState>();
  late TextEditingController emailController,passwordController;
  final storage=const FlutterSecureStorage();
  AuthController controller=Get.find();
  @override
  void onInit() {

    emailController=TextEditingController();
    passwordController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future registerController()async{
    AuthServices.login( email: emailController.text, password: passwordController.text);
  }

  String? validateEmail(String value){

    if(!GetUtils.isEmail(value)){
      return "this is wrong email";
    }else{
      return null;
    }
  }
  String? validatePassword(String value){
    if(value.length<=5){
      return "this is wrong password";
    }else{
      return null;
    }
  }
  doLogin() async {

    bool isValidate= loginFormKey.currentState!.validate();
    if(isValidate){
      isLoading(true);
      try{
        var data=await AuthServices.login( email: emailController.text, password: passwordController.text);
        if(data!=null) {
          await storage.write(key: "name",value: data.user.name);
          await storage.write(key: "token",value: data.token);
          //loginFormKey.currentState!.save();
          //loginFormKey.currentState!.save();
        await Get.offNamed(RoutesConst.home);
        }else{
          Get.snackbar('Login', 'you have something error in login');
        }

      }finally{

        isLoading(false);



      }
    }
  }
}