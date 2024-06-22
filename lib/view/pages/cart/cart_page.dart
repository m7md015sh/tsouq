import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/controller/cart_controller.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';
import 'package:tsouq/view/widgets/big_text.dart';
import 'package:tsouq/view/widgets/cart_widges/list_cart_wedgit.dart';

import '../../../core/constant/assets_image.dart';

class CartPage extends StatelessWidget {

  final controller = Get.find<CartController>();
  final productController = Get.find<ProductsController>();
  CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },icon: Icon(Icons.arrow_back,color: AppColors.mainBlackColor,),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: BigText(
            size: Dimensions.font23,
            text: 'Cart'.tr,
            fontFamily: 'Cairo',
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,

          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Center(
              child: Container(
                width: Dimensions.height45,
                height: Dimensions.height35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: AppColors.mainColor,
                ),
                child: InkWell(
                  onTap: (){
                    controller.clearAllProducts();
                  },
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                    size: Dimensions.iconSize15,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
        body: Obx((){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //showing the header

              controller.productsMap.isNotEmpty? Obx((){
                return  Expanded(
                  child: ListView.separated(
                    itemCount: controller.productsMap.length,
                    itemBuilder: (context, index) {
                      return ListCart(
                        product: controller.productsMap.keys.toList()[index],
                        index: index,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                );
              }):Column(
                children: [
                  Center(
                    child: Lottie.asset(AppImageAsset.emptyCartLottie,width: Dimensions.height330,height: Dimensions.height330,repeat: false),
                  ),
                  Text('Cart is Empty!'.tr,style: TextStyle(fontSize: Dimensions.font20,fontFamily: 'Cairo',color: AppColors.titleColor),)
                ],
              ),
              controller.productsMap.isNotEmpty? bottomCart():Container(),
            ],
          );
        })
        );
  }

  Widget bottomCart() => Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,bottom: 7),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: 'TOTAL'.tr,
                  size: 22,
                  fontFamily: 'Cairo',
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: BigText(
                      text: '${controller.total} LE',
                      fontFamily: 'Cairo',
                      size: 18,
                      color:Colors.red,
                    )),
              ],
            ),
            const Spacer(),
            MaterialButton(
              onPressed: () {
                Get.toNamed(RoutesConst.orderPage);
                print(controller.productsMap.keys.toList()[0].name);
              },
              child:  Text(
                'CHECKOUT'.tr,
                style: TextStyle(color: Colors.white,fontSize: Dimensions.font20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
              ),
              color: AppColors.mainColor,
            )
          ],
        ),
      );
}
