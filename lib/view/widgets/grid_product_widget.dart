import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/cart_controller.dart';
import 'package:tsouq/controller/favorite_controller.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';
import 'package:tsouq/view/pages/detailes/recommended_detail.dart';

import 'icon_and_text_widget.dart';

final controller = Get.find<CartController>();
final favoriteController = Get.find<FavoriteController>();

Widget buildGridProduct(
    {required index,
    required BuildContext context,
    required String image,
    required String name,
    required int price,
    int? oldPrice,
    required String category,
    //required int stock,
    int? discount,
    required ProductsController controller,
    CartController? cart_controller,
    required int indexType}) {

    if (indexType == 1) {
      return Container(
        width: double.infinity,
        height: Dimensions.height195,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: NetworkImage(image),

                      fit: BoxFit.cover,
                    ),
                    if (discount != 0)
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          color: Colors.red,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'DISCOUNT'.tr,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                ' %$discount',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.font10),
                              ),
                            ],
                          ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                        // text: category,
                        text: '$category',
                        IconColor: AppColors.iconColor1,
                        icon: Icons.category,
                      ),
                      // IconAndText(
                      //   text: '$stock',
                      //   IconColor: AppColors.mainColor,
                      //   icon: Icons.token,
                      // ),
                      // IconAndText(
                      //   text: '$ratings',
                      //   IconColor: AppColors.iconColor2,
                      //   icon: Icons.preview,
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$price'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainDarkColor),
                      ),
                      Text(
                        ' ج م'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainDarkColor),
                      ),
                      const SizedBox(
                        width: (5),
                      ),
                      if (discount != 0)
                        Text(
                          '${oldPrice != null ? oldPrice : ''}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              cart_controller
                                  ?.addToCart(controller.hotProductList[index]);
                            },
                            icon: Icon(Icons.shopping_cart),
                            color: AppColors.mainColor,
                          ),
                          IconButton(
                            onPressed: () async {
                              //ShopAppCubit.get(context).ChangeFevorate(model.id);
                              // print(model.id);
                              favoriteController.manageFavorites(1, index,
                                  await controller.hotProductList[index].id);
                            },
                            icon: favoriteController.isFavorites(
                                    controller.hotProductList[index].id)
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            color: Colors.red,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }else if (indexType == 3) {
      return Container(
        width: double.infinity,
        height: Dimensions.height195,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: NetworkImage(image),

                      fit: BoxFit.fitHeight,
                    ),
                    if (discount != 0)
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          color: Colors.red,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'DISCOUNT'.tr,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                ' %$discount',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.font10),
                              ),
                            ],
                          ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                        // text: category,
                        text: '$category',
                        IconColor: AppColors.iconColor1,
                        icon: Icons.category,
                      ),
                      // IconAndText(
                      //   text: '$stock',
                      //   IconColor: AppColors.mainColor,
                      //   icon: Icons.token,
                      // ),
                      // IconAndText(
                      //   text: '$ratings',
                      //   IconColor: AppColors.iconColor2,
                      //   icon: Icons.preview,
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$price'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainDarkColor),
                      ),
                      Text(
                        ' ج م'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainDarkColor),
                      ),
                      const SizedBox(
                        width: (5),
                      ),
                      if (discount != 0)
                        Text(
                          '${oldPrice != 0 ? oldPrice : ''}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              cart_controller
                                  ?.addToCart(controller.newProductList[index]);
                            },
                            icon: Icon(Icons.shopping_cart),
                            color: AppColors.mainColor,
                          ),
                          IconButton(
                            onPressed: () {
                              //ShopAppCubit.get(context).ChangeFevorate(model.id);
                              // print(model.id);
                              favoriteController.manageFavorites(
                                  3, index, controller.newProductList[index].id);
                            },
                            icon: favoriteController.isFavorites(
                                controller.newProductList[index].id)
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            color: Colors.red,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
    else if (indexType == 7) {
      return Container(
        width: double.infinity,
        height: Dimensions.height195,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: NetworkImage(image),

                      fit: BoxFit.fitHeight,
                    ),
                    if (discount != 0)
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          color: Colors.red,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'DISCOUNT'.tr,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                ' %$discount',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.font10),
                              ),
                            ],
                          ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                        // text: category,
                        text: '$category',
                        IconColor: AppColors.iconColor1,
                        icon: Icons.category,
                      ),
                      // IconAndText(
                      //   text: '$stock',
                      //   IconColor: AppColors.mainColor,
                      //   icon: Icons.token,
                      // ),
                      // IconAndText(
                      //   text: '$ratings',
                      //   IconColor: AppColors.iconColor2,
                      //   icon: Icons.preview,
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$price'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainDarkColor),
                      ),
                      Text(
                        ' ج م'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainDarkColor),
                      ),
                      const SizedBox(
                        width: (5),
                      ),
                      if (discount != 0)
                        Text(
                          '${oldPrice != 0 ? oldPrice : ''}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              cart_controller
                                  ?.addToCart(controller.searchList[index]);
                            },
                            icon: Icon(Icons.shopping_cart),
                            color: AppColors.mainColor,
                          ),
                          IconButton(
                            onPressed: () {
                              //ShopAppCubit.get(context).ChangeFevorate(model.id);
                              // print(model.id);
                              favoriteController.manageFavorites(
                                  7, index, controller.searchList[index].id);
                            },
                            icon: favoriteController.isFavorites(
                                    controller.searchList[index].id)
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            color: Colors.red,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    } else if (indexType == 8) {
      return Container(
        width: double.infinity,
        height: Dimensions.height195,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: NetworkImage(image),

                      fit: BoxFit.fitHeight,
                    ),
                    if (discount != 0)
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          color: Colors.red,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'DISCOUNT'.tr,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                ' %$discount',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.font10),
                              ),
                            ],
                          ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                        // text: category,
                        text: '$category',
                        IconColor: AppColors.iconColor1,
                        icon: Icons.category,
                      ),
                      // IconAndText(
                      //   text: '$stock',
                      //   IconColor: AppColors.mainColor,
                      //   icon: Icons.token,
                      // ),
                      // IconAndText(
                      //   text: '$ratings',
                      //   IconColor: AppColors.iconColor2,
                      //   icon: Icons.preview,
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$price'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainDarkColor),
                      ),
                      Text(
                        ' ج م'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainDarkColor),
                      ),
                      const SizedBox(
                        width: (5),
                      ),
                      if (true)
                        Text(
                          '${discount != 0 ? oldPrice : ''}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              cart_controller
                                  ?.addToCart(controller.catProductList[index]);
                            },
                            icon: Icon(Icons.shopping_cart),
                            color: AppColors.mainColor,
                          ),
                          IconButton(
                            onPressed: () {
                              //ShopAppCubit.get(context).ChangeFevorate(model.id);
                              // print(model.id);
                              favoriteController.manageFavorites(8, index,
                                  controller.catProductList[index].id);
                            },
                            icon: favoriteController.isFavorites(
                                    controller.catProductList[index].id)
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            color: Colors.red,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        height: Dimensions.height195,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: NetworkImage(image),
                      width: double.infinity,
                      height: Dimensions.height195,
                      fit: BoxFit.fitHeight,
                    ),
                    if (discount != 0)
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          color: Colors.red,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'DISCOUNT'.tr,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                ' %$discount',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.font10),
                              ),
                            ],
                          ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                        // text: category,
                        text: '$category',
                        IconColor: AppColors.iconColor1,
                        icon: Icons.category,
                      ),
                      // IconAndText(
                      //   text: '$stock',
                      //   IconColor: AppColors.mainColor,
                      //   icon: Icons.token,
                      // ),
                      // IconAndText(
                      //   text: '$ratings',
                      //   IconColor: AppColors.iconColor2,
                      //   icon: Icons.preview,
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$price'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainDarkColor),
                      ),
                      Text(
                        ' ج م'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainDarkColor),
                      ),
                      const SizedBox(
                        width: (5),
                      ),
                      if (discount != 0)
                        Text(
                          '${oldPrice != null ? oldPrice : ''}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              cart_controller
                                  ?.addToCart(controller.hotProductList[index]);
                            },
                            icon: Icon(Icons.shopping_cart),
                            color: AppColors.mainColor,
                          ),
                          IconButton(
                            onPressed: () {
                              //ShopAppCubit.get(context).ChangeFevorate(model.id);
                              // print(model.id);
                              favoriteController.manageFavorites(1, index,
                                  controller.hotProductList[index].id);
                            },
                            icon: favoriteController.isFavorites(
                                    controller.hotProductList[index].id)
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            color: Colors.red,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
  }

