import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/all_orders_controller.dart';
import 'package:tsouq/controller/order_controller.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/utils/colors.dart';
import '../../../utils/StyleScheme.dart';

class TrackOrderPage extends StatelessWidget {
  final int? index;
   TrackOrderPage({Key? key,@required this.index}) : super(key: key);
   final controller=Get.find<AllOrdersController>();


  @override
  Widget build(BuildContext context) {
  controller.track(index!);
    return Scaffold(
      appBar: AppBar(

        backgroundColor:AppColors.mainColor,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back,color: AppColors.mainBlackColor,),
        //   onPressed: () {
        //     Get.offNamed(RoutesConst.home);
        //   },
        // ),
        title: Text(
          "Track Order".tr,
          style: TextStyle(color: Colors.white,fontFamily: 'Cairo'),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search), onPressed: () {  },
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("كود الطلب",style: headingStyle,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.mainDarkColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "${controller.allOrderList[index!].id}",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  )
                ],
              ),

              // Text(
              //   "Order confirmed. Ready to pick",
              //   style: contentStyle.copyWith(color: Colors.grey, fontSize: 16),
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 1,
                color: Colors.grey,
              ),
              Stack(

                children: [
                  Container(

                    margin: EdgeInsets.only(right:13, top: 50),
                    width: 4,
                    height: 225,
                    color: Colors.grey,
                  ),

                Obx((){
                  return   Center(
                    child: Container(
                      child: Column(

                        children: [
                          statusWidget('confirmed', "قيد التنفيذ", controller.isProcessing.value),
                          statusWidget('shipped', "فى الطريق", controller.isShipping.value),
                          statusWidget('Delivery', "تم التوصيل", controller.isDelivered.value),
                        ],
                      ),
                    ),
                  );
                })
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 1,
                color: Colors.grey,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

Container statusWidget(String img, String status, bool isActive) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (isActive) ? AppColors.mainColor : Colors.white,
              border: Border.all(
                  color: (isActive) ? Colors.transparent : AppColors.mainColor,
                  width: 3)),
        ),
        SizedBox(
          width: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/$img.png"),
                      fit: BoxFit.contain)),
            ),
            Text(
              status,
              style: contentStyle.copyWith(
                  color: (isActive)
                      ? AppColors.mainBlackColor
                      : AppColors.paraColor),
            )
          ],
        )
      ],
    ),
  );
}
