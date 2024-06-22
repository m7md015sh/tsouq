
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/view/widgets/grid_product_widget.dart';
import 'package:tsouq/view/widgets/grid_product_widget.dart';
import 'package:tsouq/view/widgets/grid_product_widget.dart';

import '../../utils/dimensions.dart';
import '../pages/category/product_by_category.dart';
import 'grid_product_widget.dart';

class CategoryHorizontalWidget extends StatelessWidget {
    final int index;
    final ProductsController controller;



   const CategoryHorizontalWidget({Key? key,required this.index,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.getCategoryByIndex(index);
        Get.to(ProductByCategory(categoryTitle: controller.categoryList[index].name,));
      },
      child: Container(

          child:Stack(
            alignment: AlignmentDirectional.bottomCenter,
      children: [
              Image.network('${controller.categoryList[index].imageUrl}',fit: BoxFit.cover,width: Dimensions.width200,height:Dimensions.height190,),
        Container(

            width: Dimensions.width200,
            padding: EdgeInsets.symmetric(horizontal: 5),

            color: AppColors.titleColor,
            //
            child: Text(
              '${controller.categoryList[index].name}',textAlign:TextAlign.center ,
              style: TextStyle(color: Colors.white,fontSize: Dimensions.font16,fontFamily: 'Cairo'),
            )
        )

          ],
          )
      ),
    );
  }
}
