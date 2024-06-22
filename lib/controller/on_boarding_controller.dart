import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController{
  toNext();
  onBoardingChange(int index);
}

class OnBoardingControllerImp extends OnBoardingController{
  late PageController pageController;
  int currentIndex=0;
  @override
  onBoardingChange(int index) {
    currentIndex=index;
    update();
  }

  @override
  toNext() {
    currentIndex++;
    pageController.animateToPage(currentIndex, duration:const Duration(microseconds: 1500), curve: Curves.easeInOut);
  }
  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }

}