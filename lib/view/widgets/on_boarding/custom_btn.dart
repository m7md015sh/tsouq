import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/on_boarding_controller.dart';
import 'package:tsouq/core/constant/app_color.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/data/data_source/static/static.dart';
import 'package:tsouq/routes_manager.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
    padding:
    const EdgeInsets.symmetric(horizontal: 90, vertical: 2),
child: const Text(
'Continue',
style: TextStyle(color: Colors.white),
),
color: AppColor.PrimaryColor,
onPressed: () {
      if(controller.currentIndex==onBoardingList.length-1){
        Get.offAllNamed(RoutesConst.login);
      }else{
        controller.toNext();
      }
},
);
  }
}
