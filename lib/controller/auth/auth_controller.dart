import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/utils/app_constants.dart';

import '../../core/services/services_auth.dart';

class AuthController extends GetxController{
  var storage=const FlutterSecureStorage();
  var name=''.obs;
  var token=''.obs;
  var langStorage=const FlutterSecureStorage();
  var localLang=AppConstants.ara;


  //var token='';

  @override
  void onInit()async{
    authData();
    isAuth();
    //localLang=(await getLanguage)!;
    super.onInit();
  }

  authData()async{
    //name.value=(await storage.read(key: 'name'))!;

   // AppConstants.TOKEN=(await storage.read(key: "token"))!;
  }

  bool isAuth(){
    return  AppConstants.TOKEN.isNotEmpty;
  }
  doLogout()async{
   await  AuthServices.logout();
   await storage.deleteAll();
   await Get.offNamed(RoutesConst.login);

  }
  //language

 // void saveLanguage(String lang)async{
 //    await langStorage.write(key: "lang", value: lang);
 // }
 Future<String?> get getLanguage async{
    return await langStorage.read(key: "lang");
 }
  void changeLanguage(String type){
  //  saveLanguage(type);
    // Get.updateLocale(Locale(type));
    // update();
    if(localLang==type){
      return null;
    }
    if(type==AppConstants.en){
      localLang=AppConstants.en;
     // saveLanguage(AppConstants.en);
    }else{
      localLang=AppConstants.ara;
      //saveLanguage(AppConstants.ara);

    }
    update();
  }


}