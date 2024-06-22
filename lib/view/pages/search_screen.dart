import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/view/widgets/grid_product_widget.dart';
import 'package:tsouq/view/widgets/search_from_text.dart';

import '../../core/constant/assets_image.dart';
import '../../utils/dimensions.dart';
import 'detailes/recommended_detail.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  final controller=Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
              child: Row(
                children: [

                  Expanded(child: SearchFromText())
                ],
              ),
            ),
          ), 
          Expanded(
            child: GetBuilder<ProductsController>(builder: ((controller) {
              if(controller.searchController.text.isEmpty){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Lottie.asset(AppImageAsset.emptySearchLottie,width: 200,height: 200,)),
                    Text('search product or price'.tr,style: TextStyle(fontSize: Dimensions.font20,fontFamily: 'Cairo',color: AppColors.titleColor),)
                  ],
                );
              }else{
                return Obx((){
                  return SingleChildScrollView(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 1 / 1.59,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                          controller.searchList.length,
                              (index) => InkWell(
                            onTap: (){

                              Get.to(RecommendedDetail(listIndex: 7,pageId:index,));
                            },
                            child: buildGridProduct(
                              indexType: 7,
                              index:index,
                              controller: controller,
                              context:context,
                              category: controller.searchList[index].category,
                             // stock: controller.searchList[index].stock,
                              image:controller.searchList[index].images[0].url,
                              name: controller.searchList[index].name,
                              price:controller.searchList[index].price,
                              discount:controller.searchList[index].discount,
                              oldPrice: controller.searchList[index].oldPrice!=0?controller.searchList[index].oldPrice:null,


                            ),
                          )),
                    ),
                  );
                });
              }

            })),
          )
        ],
      ),
    ));
  }
}
