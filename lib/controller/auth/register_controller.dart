 import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/core/services/services_auth.dart';
import 'package:tsouq/data/model/auth_models/login_model.dart';
class RegisterController extends GetxController{
 var isLoading=false.obs;
 final registerFormKey=GlobalKey<FormState>();
 late TextEditingController nameController,emailController,passwordController;
 String name='',email='',password='';
 final storage=const FlutterSecureStorage();

 @override
  void onInit() {
    nameController=TextEditingController();
    emailController=TextEditingController();
    passwordController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

 Future registerController()async{
  AuthServices.register(name: nameController.text, email: emailController.text, password: passwordController.text);
  }
  String? validateName(String name){
   if(!name.isNotEmpty){
     return "this is wrong Name";
   }else{
     return null;
   }

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
 doRegister() async {

  bool isValidate= registerFormKey.currentState!.validate();
  if(isValidate){
    isLoading(true);
    try{
     var data=await AuthServices.register(name: nameController.text, email: emailController.text, password: passwordController.text);
     if(data!=null) {

       await storage.write(key: "name",value: data.user.name);
       await storage.write(key: "token",value: data.token);
      // registerFormKey.currentState!.save();
      Get.offAllNamed(RoutesConst.home);
     }else{
       Get.snackbar('Register', 'you have something error in register');
     }

    }finally{

      isLoading(false);



    }
  }
 }
}