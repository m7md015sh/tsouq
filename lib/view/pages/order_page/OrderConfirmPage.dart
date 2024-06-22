import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/all_orders_controller.dart';
import 'package:tsouq/controller/order_controller.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/utils/StyleScheme.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';
import 'package:tsouq/view/pages/order_page/TrackOrderPage.dart';
import 'package:tsouq/view/pages/order_page/my_order_page.dart';
import 'package:tsouq/view/widgets/grid_product_widget.dart';
import '../../../utils/colors.dart';

class OrderConfirmPage extends StatelessWidget {
   OrderConfirmPage({Key? key}) : super(key: key);
   final controller=Get.find<OrderController>();
   final allcontroller=Get.find<AllOrdersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.mainColor,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios),
        //   onPressed: () {},
        // ),
        title: Text(
          "Order Confirmed".tr,
          style: TextStyle(color: Colors.white,fontFamily: 'Cairo'),
        ),

      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/onBoard2.png'))),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Thank you for choosing us".tr,
              style: headingStyle,
            ),
            Text(
              "Your request has been submitted and we will contact you as soon as possible".tr,
              style: contentStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order ID".tr,
                  style: headingStyle,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.mainDarkColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    '${controller.order.id}',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                )
              ],
            ),
            divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Final Amount".tr,
                  style: headingStyle,
                ),
                Text(
                  "${controller.order.totalPrice+20} ج.م ",
                  style: headingStyle.copyWith(color: Colors.grey),
                ),
              ],
            ),
            divider(),
            Container(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Pick up Date & Time".tr,
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: Dimensions.height5,
                  ),
                  Text(
                    "${controller.order.createdAt}",textAlign: TextAlign.start,
                    style:
                        contentStyle.copyWith(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment Method".tr,
                  style: headingStyle,
                ),
                Text(
                  "Cash".tr,
                  style: headingStyle.copyWith(color: Colors.grey),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            InkWell(
              onTap: ()async {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => MyOrder()));
               // await allcontroller.getMyOrders();
               await Get.toNamed(RoutesConst.myOrder);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(color: AppColors.mainDarkColor),
                child: Center(
                  child: Text(
                    "MY ORDERS".tr,
                    style: contentStyle.copyWith(
                        color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container divider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    height: 1,
    color: Colors.grey,
  );
}
