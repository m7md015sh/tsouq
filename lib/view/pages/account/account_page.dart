import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/auth/auth_controller.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/utils/app_constants.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';
import 'package:tsouq/view/widgets/app_icon.dart';
import 'package:tsouq/view/widgets/big_text.dart';

import '../../widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    // bool _userLoggedIn=Get.find<AuthController>().userLoggedIn();
    // if(_userLoggedIn){
    //   Get.find<ProfileController>().getUserInfo();
    // }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: 'Profile'.tr,
            size: 24,
            fontFamily: 'Cairo',
            color: Colors.white,
          ),
        ),
        body: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Dimensions.height20,left: Dimensions.width15,right: Dimensions.width15),
          child: Column(
            children: [
              //profile icon
              AppIcon(
                icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height45 + Dimensions.height30,
                size: Dimensions.height15 * 10,
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //name
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            //   print('${controller.token}');
                            // AddOrder().makeOrder();
                          },
                          child: AccountWidget(
                            appIcon: AppIcon(
                              icon: Icons.person,
                              backgroundColor: AppColors.mainColor,
                              iconColor: Colors.white,
                              iconSize: Dimensions.height10 * 5 / 2,
                              size: Dimensions.height10 * 5,
                            ),
                            bigText: BigText(text: '${controller.name}'),
                          ),
                        );
                      }),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //Orders
                      InkWell(
                        onTap: () {
                          Get.toNamed(RoutesConst.myOrder);
                        },
                        child: AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.present_to_all,
                            backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: BigText(
                            text: 'My Orders'.tr,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //Language


                     GetBuilder<AuthController>(builder: (_)=>   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         AccountWidget(
                           appIcon: AppIcon(
                             icon: Icons.language,
                             backgroundColor: AppColors.yellowColor,
                             iconColor: Colors.white,
                             iconSize: Dimensions.height10 * 5 / 2,
                             size: Dimensions.height10 * 5,
                           ),
                           bigText: BigText(
                             text: 'Language'.tr,
                           ),
                         ),
                         Expanded(
                           child: Container(
                             margin: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                             width: Dimensions.width120,
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 6, vertical: 2),
                             decoration: BoxDecoration(
                               borderRadius:
                               BorderRadius.circular(Dimensions.radius15),
                               border: Border.all(
                                   color: AppColors.mainBlackColor, width: 2),
                             ),
                             child: DropdownButtonHideUnderline(
                               child: DropdownButton<String>(
                                 iconSize: 25,
                                 icon:
                                 const Icon(Icons.arrow_drop_down_outlined),
                                 items: [
                                   DropdownMenuItem(
                                     child: Text(
                                       AppConstants.arabic,
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: Dimensions.font16,
                                       ),
                                     ),value: AppConstants.ara,),
                                   DropdownMenuItem(
                                     child: Text(
                                       AppConstants.english,
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: Dimensions.font16,
                                       ),
                                     ),value: AppConstants.en,),


                                 ],
                                 value: controller.localLang,
                                 onChanged: (value) {
                                   //AppConstants.ara!=value;
                                   controller.changeLanguage(value!);
                                   Get.updateLocale(Locale(value));
                                 },
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),),

                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //address
                      // AccountWidget(
                      //   appIcon: AppIcon(
                      //     icon: Icons.location_on,
                      //     backgroundColor: AppColors.yellowColor,
                      //     iconColor: Colors.white,
                      //     iconSize: Dimensions.height10 * 5 / 2,
                      //     size: Dimensions.height10 * 5,
                      //   ),
                      //   bigText: BigText(
                      //     text: 'Fill in your address',
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: Dimensions.height20,
                      // ),
                      //message
                      GestureDetector(
                        onTap: () {
                          // if(Get.find<AuthController>().userLoggedIn()){
                          //   Get.find<AuthController>().clearSharedData();
                          //   Get.offNamed(RouteHelper.getSignIn());
                          //   sharedPreferences!.clear();
                          // }

                          controller.doLogout();
                        },
                        child: AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.login_outlined,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: BigText(
                            text: 'LOG OUT'.tr,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
