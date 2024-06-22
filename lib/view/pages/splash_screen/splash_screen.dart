import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/controller/auth/auth_controller.dart';
import 'package:tsouq/core/constant/app_color.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/utils/colors.dart';

import '../../../core/constant/assets_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  AuthController controller=Get.find();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 600),(){
      if(controller.isAuth()){
        Get.offAllNamed(RoutesConst.home);

      }else {
        Get.offAllNamed(RoutesConst.login,);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
       // child: Image(image: AssetImage('assets/image/logo.png'),),
       // child:Center(child: Lottie.asset(AppImageAsset.loadingLottie,width: 200,height: 200,)) ,
      )
    );
  }
}
