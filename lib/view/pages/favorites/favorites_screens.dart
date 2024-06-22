import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/controller/favorite_controller.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/view/pages/detailes/recommended_detail.dart';
import '../../../core/constant/assets_image.dart';
import '../../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class FavoritesScreens extends StatelessWidget {
  FavoritesScreens({Key? key}) : super(key: key);
  // final  favController = Get.find<FavController>();
  final productsController = Get.find<ProductsController>();
  final favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Text(
            'Favorite'.tr,
            style: TextStyle(fontSize: Dimensions.font23, fontFamily: 'Cairo'),
          ),
        ),
        body: Obx(() {
          return favoriteController.isLoading_my_fav.value == true
              ? Center(
                  child: Lottie.asset(
                  AppImageAsset.loadingLottie,
                  width: 200,
                  height: 200,
                ))
              : favoriteController.favList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Lottie.asset(AppImageAsset.emptyCartLottie,
                              width: Dimensions.height330,
                              height: Dimensions.height330,
                              repeat: false),
                        ),
                        Text(
                          'Favorite is Empty!'.tr,
                          style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontFamily: 'Cairo',
                              color: AppColors.titleColor),
                        )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Obx(() {
                        return SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: (favoriteController.favList.length),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(RecommendedDetail(
                                        listIndex: 9, pageId: index));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: Dimensions.width20,
                                        right: Dimensions.width20,
                                        bottom: Dimensions.height10),
                                    child: Row(
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.bottomStart,
                                          children: [
                                            Container(
                                              width:
                                                  Dimensions.listViewImageSize,
                                              height:
                                                  Dimensions.screenHeight / 7,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        Dimensions.radius20),
                                                    bottomRight:
                                                        Radius.circular(
                                                            Dimensions
                                                                .radius20),
                                                  ),
                                                  color: Colors.white38,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          favoriteController
                                                              .favList[index]
                                                              .images[0]
                                                              .url
                                                              .toString()),
                                                      fit: BoxFit.fitHeight)),
                                            ),
                                            if (favoriteController
                                                    .favList[index].discount !=
                                                0)
                                              Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  color: Colors.red,
                                                  //
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'DISCOUNT'.tr,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: Dimensions
                                                                .font10),
                                                      ),
                                                      Text(
                                                        ' %${favoriteController.favList[index].discount}',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: Dimensions
                                                                .font10),
                                                      ),
                                                    ],
                                                  ))
                                          ],
                                        ),
                                        //text Container
                                        Expanded(
                                          child: Container(
                                            height: Dimensions.screenHeight / 7,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      Dimensions.radius20),
                                                  bottomLeft: Radius.circular(
                                                      Dimensions.radius20),
                                                ),
                                                color: Colors.white),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: Dimensions.width10,
                                                right: Dimensions.width10,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  BigText(
                                                      text: favoriteController
                                                          .favList[index].name),
                                                  Row(
                                                    children: [
                                                      SmallText(
                                                          text:
                                                              '${favoriteController.favList[index].price.toString()} ج.م',color: AppColors.mainDarkColor),
                                                      SizedBox(
                                                        width:
                                                            Dimensions.width5,
                                                      ),
                                                      if (favoriteController
                                                              .favList[index]
                                                              .discount !=
                                                          0)
                                                        Text(
                                                          '${favoriteController.favList[index].oldPrice ?? ''}',
                                                          style: const TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.grey,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough),
                                                        ),
                                                      Spacer(),
                                                      IconButton(
                                                        icon: const Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                        ),
                                                        onPressed: () {
                                                          favoriteController
                                                              .manageFavorites(
                                                                  9,
                                                                  index,
                                                                  favoriteController
                                                                      .favList[
                                                                          index]
                                                                      .product);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    // width: Dimensions.width20,
                                                    // height: Dimensions.height5,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        IconAndText(
                                                          // text: category,
                                                          text:
                                                              '${favoriteController.favList[index].category}',
                                                          IconColor: AppColors
                                                              .iconColor1,
                                                          icon: Icons.category,
                                                        ),
                                                        IconAndText(
                                                          text:
                                                              '${favoriteController.favList[index].stock}',
                                                          IconColor: AppColors
                                                              .mainColor,
                                                          icon: Icons.token,
                                                        ),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      }));
        }));
  }
}
