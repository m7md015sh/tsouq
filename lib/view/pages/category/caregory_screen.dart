import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/view/pages/category/product_by_category.dart';
import '../../../utils/colors.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
 final controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title:  Text('Categories'.tr,style: const TextStyle(fontFamily: 'Cairo'),),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: buildCatProduct(controller.categoryList[index].imageUrl,
                  controller.categoryList[index].name,controller.categoryList[index].name,index),
            );
          },
          itemCount: controller.categoryList.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15,
            );
            },
        ));
  }
  Widget buildCatProduct(String image, String name ,String categoryName,int index) =>Obx((){
    if(controller.isLoading_category==true){
      return const CircularProgressIndicator();
    }else{
      return  InkWell(
        onTap: (){
      controller.getCategoryByIndex(index);
       Get.to(ProductByCategory(categoryTitle: controller.categoryList[index].name,));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(image),
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              size: 50,
            ),
          ],
        ),
      );
    }
  });
}
