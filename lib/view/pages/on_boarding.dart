import 'package:flutter/material.dart';
import 'package:tsouq/utils/dimensions.dart';
import 'package:tsouq/view/widgets/on_boarding/custom_btn.dart';
import 'package:tsouq/view/widgets/on_boarding/dots.dart';
import 'package:tsouq/view/widgets/on_boarding/page_view_builder.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const Expanded(flex: 3, child: OnBoardingPageViewBuilder()),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                const OnBoardingDots(),
                const Spacer(),
                Container(
                  margin:  EdgeInsets.only(bottom: Dimensions.height45),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  height: 40,
                  child: const CustomButtonOnBoarding(),
                )
              ],
            ))
      ],
    )));
  }
}
