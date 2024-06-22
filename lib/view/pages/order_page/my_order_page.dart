
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/controller/all_orders_controller.dart';
import 'package:tsouq/core/constant/assets_image.dart';
import 'package:tsouq/utils/StyleScheme.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/view/pages/order_page/TrackOrderPage.dart';
import 'package:tsouq/view/widgets/custom_loader.dart';

import 'OrderConfirmPage.dart';

class MyOrder extends StatelessWidget {
  final allOrderscontroller=Get.find<AllOrdersController>();

  MyOrder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Orders'.tr,style: TextStyle(fontFamily: 'Cairo'),),
        backgroundColor: AppColors.mainColor,
      ),
      body: Obx((){
        return  Column(
          children: [Expanded(
            child: allOrderscontroller.isLoading_my_orders.value==true?Center(
              child: Lottie.asset(AppImageAsset.loadingLottie,width: 200,height: 200,),
            ): ListView.builder(itemCount: allOrderscontroller.allOrderList.length,itemBuilder: (context,index){
              return  OrderCard(controller: allOrderscontroller,index: index,);
            }),
          )],
        );
      })
    );
  }
}
class OrderCard extends StatelessWidget {
  final AllOrdersController controller;
  final int index;
  const  OrderCard({Key? key,required this.controller,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
     // margin: EdgeInsets.zero,
elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('كود الطلب',style: headingStyle,),

                  Text('${controller.allOrderList[index].id}',style: headingStyle.copyWith(color: Colors.grey)),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                        color: AppColors.mainDarkColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('item Price'.tr,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,fontFamily: 'Cairo',color: Colors.white)),
                        Text(' ${controller.allOrderList[index].itemsPrice} ج.م ',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,fontFamily: 'Cairo',color: Colors.white)),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.mainDarkColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Delivery Price'.tr,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,fontFamily: 'Cairo',color: Colors.white)),
                        Text('20 ج.م ',style:TextStyle(fontSize: 13,fontWeight: FontWeight.bold,fontFamily: 'Cairo',color: Colors.white)),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                        color: AppColors.mainDarkColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Total Price'.tr,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,fontFamily: 'Cairo',color: Colors.white)),
                        Text('${controller.allOrderList[index].itemsPrice+20} ج.م',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,fontFamily: 'Cairo',color: Colors.white)),

                      ],
                    ),
                  )



                ],
              ),
            ),
            //Text('total Price:  ${controller.allOrderList[index].itemsPrice+20} EL'),

            Padding(
              padding: const EdgeInsets.only(top:10.0,bottom: 3,left: 3,right: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('الاسم'.tr, style: headingStyle,),
                  Expanded(
                    child: Text('${controller.allOrderList[index].shippingInfo.name}',overflow: TextOverflow.ellipsis,maxLines: 1,
                      softWrap: false,textAlign: TextAlign.left, style: headingStyle.copyWith(color: Colors.grey),),
                  ),
                ],
              )
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('رقم الهاتف', style: headingStyle,),
                  Expanded(child: Text('${controller.allOrderList[index].shippingInfo.phoneNo}',overflow: TextOverflow.ellipsis,maxLines: 1,
                      softWrap: false,textAlign: TextAlign.left, style: headingStyle.copyWith(color: Colors.grey),))
                ],
              ),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('العنوان   ',
                    style: headingStyle,),
                  Expanded(
                    child: Text('${controller.allOrderList[index].shippingInfo.address}',overflow: TextOverflow.ellipsis,maxLines: 4,
                      softWrap: false, style: headingStyle.copyWith(color: Colors.grey),textAlign: TextAlign.left,),
                  )
                ],
              ),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('تاريخ الانشاء', style: headingStyle,),
                  Text('${controller.allOrderList[index].createdAt}', style: headingStyle.copyWith(color: Colors.grey),)
                ],
              ),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.only(top:3.0,bottom: 10,left: 3,right: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('حالة الطلب', style: headingStyle,),
                  Text('${controller.allOrderList[index].orderStatus}',style: headingStyle.copyWith(color: Colors.grey),),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Get.off(TrackOrderPage(index: index));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.mainDarkColor,
                ),
                child: Text(

                  "Track your Order".tr,
                  style:  TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'Cairo',color: Colors.white,),textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
