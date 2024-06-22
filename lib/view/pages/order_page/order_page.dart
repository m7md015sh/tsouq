import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/controller/order_controller.dart';
import 'package:tsouq/core/constant/assets_image.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/data/model/order_model.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';
import 'package:tsouq/view/widgets/app_text_field.dart';
import 'package:tsouq/view/widgets/big_text.dart';
import 'package:tsouq/view/widgets/custom_loader.dart';

import '../../widgets/show_custom_message.dart';


class OrderPage extends StatelessWidget  {
  void _order(OrderController orderController) async{
    var orderController=Get.find<OrderController>();
    String name = orderController.nameController.text;
    String phone = orderController.phoneController.text;
    String address =orderController.addressController.text;
    String state =orderController. stateController.text;

    if (name.isEmpty) {
      showCustomSnackBar('Type in your name',Colors.redAccent ,title: 'name');
    }
    else if(!phone.isPhoneNumber){
      showCustomSnackBar('Type in your phone',Colors.redAccent ,title: 'phone');
    }
    else if (address.isEmpty) {
      showCustomSnackBar('Type in your address',Colors.redAccent, title: 'address');
    }
    else {
     // shippingInfo =
        //  ShippingInfo(name: name, address: address, phoneNo: phone, state: state);
    await orderController.doOrder();

    Get.offAndToNamed(RoutesConst.orderConfirmed);

      //print(signUpBodyModel.toString());
      // orderController.registration(signUpBodyModel).then((status){
      //   // if(status.){
      //   Get.offNamed(RoutesConst.home);
      //   showCustomSnackBar('تم تسجيل الدخول بنجاح', Colors.green,isError: false,title: 'Perfect');
      //   // }else{
      //   //showCustomSnackBar(status.message,Colors.redAccent);
      //   //  }
      // });
    }
  }

   OrderPage({Key? key}) : super(key: key);
   late ShippingInfo shippingInfo;
   final orderController=Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('order information'.tr,style: const TextStyle(fontFamily: 'Cairo'),),
        backgroundColor: AppColors.mainColor,
      ),
      body: Obx((){
        return orderController.isLoading.value==true?Center(child: Lottie.asset(AppImageAsset.loadingLottie,width: 200,height: 200,)): Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextField(

              textController: orderController.nameController,
              hintText: 'Full Name'.tr,
              icon: Icons.person,
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            AppTextField(
              textController: orderController.phoneController,

              hintText: 'Phone'.tr,
              icon: Icons.phone,
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            AppTextField(
              textController: orderController.addressController,

              hintText: 'Address'.tr,
              icon: Icons.location_on,
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            AppTextField(
              textController: orderController.stateController,

              hintText: 'Order notes'.tr,
              icon: Icons.note_alt_outlined,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            InkWell(
              onTap: () {
                _order(orderController);



              },
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height18,
                    bottom: Dimensions.height18,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                child: BigText(
                  text: "Make Order".tr,

                  fontFamily: 'Cairo',
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
              ),
            ),

          ],
        );
      }),
    );
  }

}
