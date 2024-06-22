import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/cart_controller.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/view/pages/detailes/recommended_detail.dart';

import '../widgets/grid_product_widget.dart';

class AllViewProducts extends StatelessWidget {
  final int index;
   AllViewProducts({Key? key,required this.index}) : super(key: key);
  final controller=Get.find<ProductsController>();
  final cartController=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    if(index==1){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,

          title: Text('Hot Products'.tr,style: TextStyle(fontFamily: 'Cairo'),),
        ),
        body:  Obx(() {
          if (controller.isLoading_hot_products.value) {
            return const SizedBox(
              width: double.infinity,
              height: 500,
            );
          } else {
            return SingleChildScrollView(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.59,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                    controller.hotProductList.length,
                        (index) => InkWell(
                      onTap: () {
                        Get.to(() => RecommendedDetail(
                          listIndex: 1,
                          pageId:  controller.hotProductList.length-1-index,
                        ));
                      },
                      child: buildGridProduct(
                        indexType: 1,
                        index: index,
                        controller: controller,
                        context: context,
                        category: controller.hotProductList[controller.hotProductList.length-1-index].category,
                      //  stock: controller.hotProductList[controller.hotProductList.length-1-index].stock,
                        image: controller.hotProductList[controller.hotProductList.length-1-index].images[0].url,
                        name: controller.hotProductList[controller.hotProductList.length-1-index].name,
                        price: controller.hotProductList[controller.hotProductList.length-1-index].price,
                        discount: controller.hotProductList[controller.hotProductList.length-1-index].discount,
                        oldPrice:  controller.hotProductList[controller.hotProductList.length-1-index].oldPrice!=0?controller.hotProductList[controller.hotProductList.length-1-index].oldPrice:null,
                        cart_controller: cartController,
                      ),
                    )),
              ),
            );
          }
        }),
      );
    }else if(index==3){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,

          title: Text('new Products'.tr,style: TextStyle(fontFamily: 'Cairo'),),
        ),
        body:  Obx(() {
          if (controller.isLoading_hot_products.value) {
            return const SizedBox(
              width: double.infinity,
              height: 500,
            );
          } else {
            return SingleChildScrollView(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.59,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                    controller.newProductList.length,
                        (index) => InkWell(
                      onTap: () {
                        Get.to(() => RecommendedDetail(
                          listIndex: 3,
                          pageId: index,
                        ));
                      },
                      child: buildGridProduct(
                        indexType: 3,
                        index: controller.newProductList.length-1-index,
                        controller: controller,
                        context: context,
                        category: controller.newProductList[controller.newProductList.length-1-index].category,
                       // stock: controller.newProductList[controller.newProductList.length-1-index].stock,
                        image: controller.newProductList[controller.newProductList.length-1-index].images[0].url,
                        name: controller.newProductList[controller.newProductList.length-1-index].name,
                        price: controller.newProductList[controller.newProductList.length-1-index].price,
                        discount: controller.newProductList[controller.newProductList.length-1-index].discount,
                        oldPrice:  controller.newProductList[controller.newProductList.length-1-index].oldPrice!=0?controller.newProductList[controller.newProductList.length-1-index].oldPrice:null,
                        cart_controller: cartController,
                      ),
                    )),
              ),
            );
          }
        }),
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,

          title: Text('All Hot Product'),
        ),
        body:  Obx(() {
          if (controller.isLoading_hot_products.value) {
            return const SizedBox(
              width: double.infinity,
              height: 500,
            );
          } else {
            return SingleChildScrollView(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.59,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                    controller.hotProductList.length,
                        (index) => InkWell(
                      onTap: () {
                        Get.to(() => RecommendedDetail(
                          listIndex: 1,
                          pageId: index,
                        ));
                      },
                      child: buildGridProduct(
                        indexType: 1,
                        index: index,
                        controller: controller,
                        context: context,
                        category: controller.hotProductList[index].category,
                       // stock: controller.hotProductList[index].stock,
                        image: controller.hotProductList[index].images[0].url,
                        name: controller.hotProductList[index].name,
                        price: controller.hotProductList[index].price,
                        discount: controller.hotProductList[index].discount,
                        oldPrice:  controller.hotProductList[index].oldPrice!=0?controller.hotProductList[index].oldPrice:null,
                        cart_controller: cartController,
                      ),
                    )),
              ),
            );
          }
        }),
      );
    }
  }
}
