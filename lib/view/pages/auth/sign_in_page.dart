import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/bindings/cart_binding.dart';
import 'package:tsouq/bindings/products_pinding.dart';
import 'package:tsouq/controller/auth/login_controller.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/core/constant/assets_image.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/view/widgets/custom_loader.dart';
import '../../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../home/main_product_page.dart';

class SignInPage extends StatelessWidget {
   SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GetBuilder<LoginController>(builder: (controller){
      return  Scaffold(
          backgroundColor: Colors.white,
          body:Obx((){
            return controller.isLoading.value==true?Center(child: Lottie.asset(AppImageAsset.loadingLottie,width: 200,height: 200,)): Column(
              children: [
                SizedBox(
                  height: Dimensions.screenHeight * 0.06,
                ),
                SizedBox(

                  height: Dimensions.screenHeight * 0.25,
                  child: const Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      backgroundImage: AssetImage("assets/image/tsouq.jpg"),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),

                Expanded(child:   SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20 ),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello'.tr,
                              style: TextStyle(
                                  fontSize: Dimensions.font20*3+Dimensions.font20/2,
                                  fontWeight: FontWeight.bold
                              ),

                            ),
                            Text(
                              'Sign into your account'.tr,
                              style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  color: Colors.grey[500]
                              ),

                            ),
                            SizedBox(
                              height: Dimensions.height15,
                            ),
                          ],
                        ),
                      ),

                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: controller.loginFormKey,
                        child: Column(
                          children: [
                            AppTextField(
                              textController: controller.emailController,
                              hintText: 'Email'.trim().tr,
                              icon: Icons.email,
                              validator: (value){
                                return controller.validateEmail(value);
                              },
                            ),
                            SizedBox(
                              height: Dimensions.height15,
                            ),
                            AppTextField(
                              textController: controller.passwordController,
                              hintText: 'Password'.tr,
                              icon: Icons.lock,
                              isObscure: true,
                              validator: (value){
                                return controller.validatePassword(value);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          RichText(
                            text: TextSpan(
                                text: "Sign into your account".tr,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20,
                                )

                            ),

                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      // Obx((){
                      //   return controller.isLoading.value==true?Center(child: CircularProgressIndicator()):Text("");
                      // }),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      //sing up button
                      GestureDetector(
                        onTap:(){
                          controller.doLogin();
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor,
                          ),

                          child: Center(
                              child: BigText(
                                text: 'Sign In'.tr,
                                size: Dimensions.font20 ,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      //tag line


                      SizedBox(
                        height: Dimensions.screenHeight*0.02,
                      ),
                      //sign up options
                      RichText(
                          text: TextSpan(
                              text: "Don't an account?".tr,
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20,
                              ),

                              children: [

                                TextSpan(
                                    recognizer: TapGestureRecognizer()..onTap=()=> Get.offAllNamed(RoutesConst.register),
                                    text: " Create".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: Dimensions.font20+2,
                                        fontWeight: FontWeight.bold
                                    ),
                                    children: const [

                                    ]

                                )
                              ]

                          )),



                    ],
                  ),
                ))
              ],
            );
          })

      );
    });
  }
}
