import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/bindings/fav_binding.dart';
import 'package:tsouq/bindings/products_pinding.dart';
import 'package:tsouq/controller/cart_controller.dart';
import 'package:tsouq/controller/favorite_controller.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/data/model/products_model.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';
import 'package:tsouq/view/widgets/big_text.dart';
import 'package:tsouq/view/widgets/carousal_widget.dart';
import 'package:tsouq/view/widgets/category_horizontal_widget.dart';
import 'package:tsouq/view/widgets/grid_product_widget.dart';
import 'package:tsouq/view/widgets/icon_and_text_widget.dart';
import 'package:tsouq/view/widgets/small_text.dart';
import '../../../core/constant/assets_image.dart';
import '../all_view_product_page.dart';
import '../detailes/recommended_detail.dart';

class ProductPageBody extends StatefulWidget {
  const ProductPageBody({Key? key}) : super(key: key);

  @override
  _ProductPageBodyState createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
  // PageController pageController = PageController(viewportFraction: 0.85);
  final pageController = CarouselController();
  var _currPageValue = 0;

  //double _scaleFactor = 0.8;
  //double _height = Dimensions.pageViewContainer;
  final controller = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.height15,
        ),

        //recommended text
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                BigText(
                  text: 'Hot Products'.tr,
                  fontFamily: 'Cairo',
                  color: AppColors.mainDarkColor,
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.to(AllViewProducts(index: 1),
                        binding: ProductBinding());
                  },
                  child: Text(
                    "see more".tr,
                    style: TextStyle(
                        color: AppColors.paraColor,
                        fontFamily: 'Cairo',
                        fontSize: Dimensions.font16),
                  ),
                )
              ],
            )),
        //Grid
        Obx(() {
          if (controller.isLoading_hot_products.value) {
            return SizedBox(
              width: double.infinity,
              height: 500,
              child: Center(
                  child: Lottie.asset(
                AppImageAsset.loadingApiLottie,
                width: Dimensions.height190,
                height: Dimensions.height190,
              )),
            );
          } else {
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.59,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                  controller.hotProductList.length <= 4
                      ? controller.hotProductList.length
                      : 4,
                  (index) => InkWell(
                        onTap: () {
                          Get.to(
                              () => RecommendedDetail(
                                    listIndex: 1,
                                    pageId: controller.hotProductList.length-1-index,
                                  ),
                              binding: FavBinding());
                        },
                        child: buildGridProduct(
                          indexType: 1,
                          index: controller.hotProductList.length-1-index,
                          controller: controller,
                          context: context,
                          image: controller.hotProductList[controller.hotProductList.length-1-index].images[0].url,
                          name: controller.hotProductList[controller.hotProductList.length-1-index].name,
                          price: controller.hotProductList[controller.hotProductList.length-1-index].price,
                          category: controller.hotProductList[controller.hotProductList.length-1-index].category,
                          // stock: controller.hotProductList[index].stock,
                          discount: controller.hotProductList[controller.hotProductList.length-1-index].discount,
                          oldPrice:
                              controller.hotProductList[controller.hotProductList.length-1-index].oldPrice != 0
                                  ? controller.hotProductList[controller.hotProductList.length-1-index].oldPrice
                                  : null,
                          cart_controller: cartController,
                        ),
                      )),
            );
          }
        }),
        SizedBox(
          height: Dimensions.height10,
        ),

        //================================

        //recommended text
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                BigText(
                  text: 'new Products'.tr,
                  fontFamily: 'Cairo',
                  color: AppColors.mainDarkColor,
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.to(AllViewProducts(index: 3),
                        binding: ProductBinding());
                  },
                  child: Text(
                    "see more".tr,
                    style: TextStyle(
                        color: AppColors.paraColor,
                        fontFamily: 'Cairo',
                        fontSize: Dimensions.font16),
                  ),
                )
              ],
            )),
        //Grid
        Obx(() {
          if (controller.isLoading_hot_products.value) {
            return SizedBox(
              width: double.infinity,
              height: 500,
              child: Center(
                  child: Lottie.asset(
                AppImageAsset.loadingApiLottie,
                width: Dimensions.height190,
                height: Dimensions.height190,
              )),
            );
          } else {
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.59,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                  controller.newProductList.length <= 4
                      ? controller.newProductList.length
                      : 4,
                  (index) => InkWell(
                        onTap: () {
                          Get.to(
                              () => RecommendedDetail(
                                    listIndex: 3,
                                    pageId: controller.newProductList.length -
                                        1 -
                                        index,
                                  ),
                              binding: FavBinding());
                        },
                        child: buildGridProduct(
                          indexType: 3,
                          index: controller.newProductList.length - 1 - index,
                          controller: controller,
                          context: context,
                          image: controller
                              .newProductList[
                                  controller.newProductList.length - 1 - index]
                              .images[0]
                              .url,
                          name: controller
                              .newProductList[
                                  controller.newProductList.length - 1 - index]
                              .name,
                          price: controller
                              .newProductList[
                                  controller.newProductList.length - 1 - index]
                              .price,
                          category: controller
                              .newProductList[
                                  controller.newProductList.length - 1 - index]
                              .category,
                          // stock: controller.newProductList[index].stock,
                          discount: controller
                              .newProductList[
                                  controller.newProductList.length - 1 - index]
                              .discount,
                          oldPrice: controller
                                      .newProductList[
                                          controller.newProductList.length -
                                              1 -
                                              index]
                                      .oldPrice !=
                                  0
                              ? controller
                                  .newProductList[
                                      controller.newProductList.length -
                                          1 -
                                          index]
                                  .oldPrice
                              : null,
                          cart_controller: cartController,
                        ),
                      )),
            );
          }
        }),
        SizedBox(
          height: Dimensions.height10,
        ),

        //================================

        //popular text
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width15),
          child: BigText(
            text: 'All Products'.tr,
            fontFamily: 'Cairo',
            color: AppColors.mainDarkColor,
          ),
        ),
        SizedBox(
          height: Dimensions.height5,
        ),
        //popular products
        Obx(() {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.allProductList.length,
              itemBuilder: (context, index) {
                int reversedIndex =
                    controller.allProductList.length - 1 - index;
                if (controller.isLoading_products.value == true) {
                  return Container(
                    width: double.infinity,
                    height: 250,
                    child: Center(
                        child: Lottie.asset(
                      AppImageAsset.loadingApiLottie,
                      width: Dimensions.height190,
                      height: Dimensions.height190,
                    )),
                  );
                } else {
                  return popularProducts(
                      image: controller
                          .allProductList[reversedIndex].images[0].url,
                      name: controller.allProductList[reversedIndex].name,
                      price: controller.allProductList[reversedIndex].price,
                      oldPrice:
                          controller.allProductList[reversedIndex].oldPrice,
                      category: controller
                          .allProductList[reversedIndex].category
                          .toString(),
                      //stock: controller.allProductList[index].stock,
                      ratings: controller.allProductList[reversedIndex].ratings,
                      index: reversedIndex,
                      discount:
                          controller.allProductList[reversedIndex].discount,
                      product: controller.allProductList[reversedIndex]);
                }
              });
        }),
      ],
    );
  }
  //
  // Widget _buildPageItem(int index,
  //     {required String image, required String name}) {
  //   Matrix4 matrix = Matrix4.identity();
  //   if (index == _currPageValue.floor()) {
  //     var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
  //     var currTrans = _height * (1 - currScale) / 2;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, currTrans, 0);
  //   } else if (index == _currPageValue.floor() + 1) {
  //     var currScale =
  //         _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
  //     var currTrans = _height * (1 - currScale) / 2;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1);
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, currTrans, 0);
  //   } else if (index == _currPageValue.floor() - 1) {
  //     var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
  //     var currTrans = _height * (1 - currScale) / 2;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1);
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, currTrans, 0);
  //   } else {
  //     var currScale = 0.8;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
  //   }
  //   return Transform(
  //     transform: matrix,
  //     child: Stack(
  //       children: [
  //         GestureDetector(
  //           onTap: () {
  //             //Get.toNamed(RouteHelper.getPopularProduct(index));
  //           },
  //           child: Container(
  //             height: Dimensions.pageViewContainer,
  //             margin: EdgeInsets.only(
  //               left: Dimensions.width10,
  //               right: Dimensions.width10,
  //             ),
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(Dimensions.radius30),
  //                 color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
  //                 image: DecorationImage(
  //                     fit: BoxFit.cover, image: NetworkImage(image))),
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.bottomCenter,
  //           child: Container(
  //             height: Dimensions.pageViewTextContainer,
  //             margin: EdgeInsets.only(
  //               left: Dimensions.width30,
  //               right: Dimensions.width30,
  //               bottom: Dimensions.height30,
  //             ),
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(Dimensions.radius20),
  //                 color: Colors.white,
  //                 boxShadow: const [
  //                   BoxShadow(
  //                     color: Color(0xFFe8e8e8),
  //                     blurRadius: 5.0,
  //                     offset: Offset(0, 5),
  //                   ),
  //                   BoxShadow(
  //                     color: Colors.white,
  //                     offset: Offset(-5, 0),
  //                   ),
  //                   BoxShadow(
  //                     color: Colors.white,
  //                     offset: Offset(5, 0),
  //                   )
  //                 ]),
  //             child: Container(
  //                 padding: EdgeInsets.only(
  //                     top: Dimensions.height15,
  //                     left: Dimensions.height15,
  //                     right: Dimensions.height15),
  //                 child: AppColumn(name)),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget popularProducts(
          {required String image,
          required String name,
          required int price,
          required int oldPrice,
          required String category,
          //required int stock,
          int? discount,
          required int ratings,
          required index,
          required Product product}) =>
      GestureDetector(
        onTap: () {
          //Get.toNamed(RouteHelper.getRecommendedProduct(index));
          Get.to(
              () => RecommendedDetail(
                    listIndex: 0,
                    pageId: index,
                  ),
              binding: FavBinding());
        },
        child: Container(
          margin: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: Dimensions.height10),
          child: Row(
            // textDirection: TextDirection.rtl,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    width: Dimensions.listViewImageSize,
                    height: Dimensions.listViewTextContauner + 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                        ),
                        color: Colors.white38,
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.fitHeight)),
                  ),
                  if (discount != 0)
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.red,
                        //
                        child: Row(
                          children: [
                            Text(
                              'DISCOUNT'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.font10),
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
              //text Container
              Expanded(
                child: Container(
                  height: Dimensions.listViewTextContauner + 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        bottomLeft: Radius.circular(Dimensions.radius20),
                      ),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Dimensions.width10,
                      right: Dimensions.width10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BigText(text: name),
                        Row(
                          children: [
                            Text(
                              '$price',
                              style: TextStyle(
                                  color: AppColors.mainDarkColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14),
                            ),
                            Text(
                              ' ج م',
                              style: TextStyle(
                                  color: AppColors.mainDarkColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: Dimensions.width5,
                            ),
                            if (discount != 0)
                              Text(
                                '${oldPrice != null ? oldPrice : ''}',
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            const Spacer(),
                            Obx(() {
                              return Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cartController.addToCart(product);
                                      },
                                      icon: Icon(
                                        Icons.shopping_cart_sharp,
                                        color: AppColors.mainColor,
                                      )),
                                  IconButton(
                                    onPressed: () {
                                      favoriteController.manageFavorites(
                                          0,
                                          index,
                                          controller.allProductList[index].id);
                                    },
                                    icon: favoriteController.isFavorites(
                                            controller.allProductList[index].id)
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : const Icon(Icons.favorite_border,
                                            color: Colors.red),
                                  ),
                                ],
                              );
                            })
                          ],
                        ),
                        SizedBox(
                          // width: Dimensions.width20,
                          height: Dimensions.height20 + 4,
                          child: Row(
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
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
