import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/controller/auth/register_controller.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';
import 'package:tsouq/view/widgets/app_text_field.dart';
import 'package:tsouq/view/widgets/big_text.dart';
import 'package:tsouq/view/widgets/custom_loader.dart';
import 'package:tsouq/view/widgets/show_custom_message.dart';

import '../../../core/constant/assets_image.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var emailController = TextEditingController();
    // var nameController = TextEditingController();
    // var phoneController = TextEditingController();
    // var passwordController = TextEditingController();
    // var addressController = TextEditingController();
    // var signUpImages = ["t.png", "f.png", "g.png"];


    return GetBuilder<RegisterController>(builder: (controller){
      return   Scaffold(
          backgroundColor: Colors.white,
          body:Obx((){
            return controller.isLoading.value==true?Center(child: Lottie.asset(AppImageAsset.loadingLottie,width: 200,height: 200,)):Container(
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.screenHeight * 0.06,
                  ),
                  Container(
                    height: Dimensions.screenHeight * 0.19,
                    child: Center(
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
                  Expanded(
                      child:SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Form(
                          key: controller.registerFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              AppTextField(
                                textController:controller. nameController,
                                hintText: 'Full Name'.tr,
                                icon: Icons.person,
                                validator:(value){
                                  return controller.validateName(value);
                                },
                              ),
                              SizedBox(
                                height: Dimensions.height15,
                              ),
                              AppTextField(
                                textController: controller.emailController,
                                hintText: 'Email'.trim().tr,
                                icon: Icons.email,
                                validator:(value){
                                  return controller.validateEmail(value);
                                },
                              ),
                              SizedBox(
                                height: Dimensions.height15,
                              ),
                              AppTextField(
                                textController:controller. passwordController,
                                hintText: 'Password'.tr,
                                icon: Icons.lock,
                                isObscure: true,
                                validator:(value){
                                  return controller.validatePassword(value);
                                },
                              ),
                              // SizedBox(
                              //   height: Dimensions.height15,
                              // ),
                              // AppTextField(
                              //   // textController: phoneController,
                              //   hintText: 'Phone (optional)'.tr,
                              //   icon: Icons.phone,
                              // ),
                              // SizedBox(
                              //   height: Dimensions.height15,
                              // ),
                              // AppTextField(
                              //   // textController: addressController,
                              //   hintText: 'Address (optional)'.tr,
                              //   icon: Icons.location_on,
                              // ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),

                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              //sing up button
                              GestureDetector(
                                onTap: () {
                                  controller.doRegister();
                                },
                                child: Container(
                                  width: Dimensions.screenWidth / 2,
                                  height: Dimensions.screenHeight / 13,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(Dimensions.radius30),
                                    color: AppColors.mainColor,
                                  ),
                                  child: Center(
                                      child: BigText(
                                        text: 'Sign Up'.tr,
                                        size: Dimensions.font20,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height15,
                              ),
                              //tag line
                              InkWell(

                                child: RichText(
                                    text: TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Get.offNamed(RoutesConst.login),
                                        text: "Have an account already?".tr,
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: Dimensions.font20,
                                        ))),
                              ),
                              SizedBox(
                                height: Dimensions.screenHeight * 0.02,
                              ),
                              //sign up options
                              // RichText(
                              //     text: TextSpan(
                              //         text: "Sign up using one of following methods",
                              //         style: TextStyle(
                              //           color: Colors.grey[500],
                              //           fontSize: Dimensions.font16,
                              //         ))),
                              // SizedBox(
                              //   height: Dimensions.height15,
                              // ),
                              // Wrap(
                              //     children: List.generate(
                              //         3,
                              //             (index) => Padding(
                              //           padding:
                              //           const EdgeInsets.symmetric(horizontal: 8.0),
                              //           child: CircleAvatar(
                              //             radius: Dimensions.radius30,
                              //             // backgroundImage: AssetImage(
                              //             //     "assets/image/" + signUpImages[index]),
                              //           ),
                              //         )))
                            ],
                          ),
                        ),
                      )
                  )
                ],
              ),
            );
          })
      );
    });
  }
}