
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/auth/register_controller.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // print('i am printing loading state'+Get.find<RegisterController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimensions.height20*4,
        width: Dimensions.height20*4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height20*5/3),
          color: AppColors.mainColor,

        ),
        alignment: Alignment.center,

        child: CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}
