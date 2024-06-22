import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/on_boarding_controller.dart';
import 'package:tsouq/data/data_source/static/static.dart';

import '../../../core/constant/app_color.dart';

class OnBoardingDots extends GetView<OnBoardingControllerImp> {
  const OnBoardingDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
                  (index) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                duration: const Duration(
                  milliseconds: 400,
                ),
                width: controller.currentIndex==index?20:6,
                height: 6,
                decoration: BoxDecoration(
                    color: AppColor.PrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ))
        ],
      );
    });
  }
}
