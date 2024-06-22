import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/view/pages/detailes/recommended_detail.dart';
import 'package:tsouq/view/widgets/grid_product_widget.dart';

import '../../../core/constant/assets_image.dart';

class ProductByCategory extends StatelessWidget {
  final String categoryTitle;
   ProductByCategory({Key? key,required this.categoryTitle}) : super(key: key);
  final controller=Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(categoryTitle,style: const TextStyle(fontFamily: 'Cairo'),),
      ),
      body: Obx((){
        if(controller.isLoading_productsByCat.value)
        {
          return  Center(child: Lottie.asset(AppImageAsset.loadingLottie,width: 200,height: 200,));
        }else{
          return SingleChildScrollView(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.59,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                  controller.catProductList.length,
                      (index) => InkWell(
                        onTap: (){
                          Get.to(RecommendedDetail(listIndex: 8,pageId:index));
                        },
                        child: buildGridProduct(
                          indexType: 8,
                    index:index,
                    controller: controller,
                    context:context,
                    image:controller.catProductList[index].images[0].url,
                    name: controller.catProductList[index].name,
                     category: controller.catProductList[index].category,
                   //  stock: controller.catProductList[index].stock,
                    price:controller.catProductList[index].price,
                          discount:controller.catProductList[index].discount,
                          oldPrice: controller.catProductList[index].oldPrice!=0?controller.catProductList[index].oldPrice:null,


                        ),
                      )),
            ),
          );
        }
      }



      )
    );
  }
}
