import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/on_boarding_controller.dart';
import 'package:tsouq/core/constant/app_color.dart';

import '../../../data/data_source/static/static.dart';

class OnBoardingPageViewBuilder extends StatelessWidget {
  const OnBoardingPageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImp controller=Get.put(OnBoardingControllerImp());

    return PageView.builder(

      onPageChanged: (val){
        controller.onBoardingChange(val);
      },
        controller: controller.pageController,

        itemCount: onBoardingList.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                onBoardingList[i].title!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                onBoardingList[i].image!,
                height: 260,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                onBoardingList[i].body!,
                style: const TextStyle(
                    fontSize: 16, height: 2, color: AppColor.grey),
                textAlign: TextAlign.center,
              ),
            ],
          );
        });
  }
}
