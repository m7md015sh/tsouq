import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/cart_controller.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/view/widgets/small_text.dart';

import '../../../data/model/products_model.dart';
import '../../../utils/dimensions.dart';
import '../big_text.dart';

class ListCart extends StatelessWidget {
  final dynamic product;
  final int index;

  const ListCart({required this.product,required this.index,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller=Get.find<CartController>();
    return Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(40)),
      height: 140,
      child: Row(
        children: [
          Container(

            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.images[0].url)
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: Container(
              width: Dimensions.width200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('${product.name}',
                //textAlign: align,
                  maxLines: 1,
                  softWrap: false,

                style: TextStyle(
                  overflow: TextOverflow.ellipsis,

                  color: AppColors.mainDarkColor,
                  //fontFamily: fontFamily,

                  fontSize:Dimensions.font20,
                  fontWeight: FontWeight.w500,
                ),
              ),
                  const SizedBox(
                    height: 10,
                  ),
                 Obx((){
                   return  BigText(
                     text: '${controller.productSubTotal[index]} LE',
                     color: AppColors.titleColor,
                     size: 18,
                   );
                 }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 130,
                        color: Colors.grey.shade200,
                        height: 40,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.addToCart(product);
                                },
                                icon: const Icon(Icons.add_circle)),
                            Obx((){
                              return  BigText(text: '${controller.productsMap.values.toList()[index]}');
                            }),

                            Padding(
                                padding:
                                const EdgeInsets.only(bottom: 13.0),
                                child: IconButton(
                                    onPressed: () {
                                      if(controller.productsMap.values.toList()[index]>1){
                                        controller.removeFromCart(product);
                                      }
                                    },
                                    icon: const Icon(Icons.remove_circle))),
                          ],
                        ),
                      ),

                      IconButton(onPressed: (){
                        controller.removeOneProduct(product);
                      }, icon:const Icon(Icons.delete))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
