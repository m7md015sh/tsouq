import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/cart_controller.dart';
import 'package:tsouq/controller/favorite_controller.dart';
import 'package:tsouq/controller/products_controller.dart';
import 'package:tsouq/data/model/products_model.dart';
import 'package:tsouq/view/pages/detailes/image_bigger.dart';
import 'package:tsouq/view/widgets/big_text.dart';
import 'package:tsouq/view/widgets/expandable_text.dart';
import '../../../core/constant/routes_const.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';

class RecommendedDetail extends StatefulWidget {
  final int pageId;
  final int listIndex;
  const RecommendedDetail(
      {Key? key, required this.pageId, required this.listIndex})
      : super(key: key);

  @override
  State<RecommendedDetail> createState() => _RecommendedDetailState();
}

class _RecommendedDetailState extends State<RecommendedDetail> {
  // print('product name is'+product['_id']);
  PageController pageController = PageController(viewportFraction: 0.85);
  final productController = Get.find<ProductsController>();
  final favoriteController = Get.find<FavoriteController>();
  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  final cartController = Get.find<CartController>();
  double _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    if (widget.listIndex == 0) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 70,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child:
                              Container(child: AppIcon(icon: Icons.arrow_back)),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        // GestureDetector(
                        //   // onTap: () {
                        //   //   // Get.toNamed(RouteHelper.getCartPage());
                        //   // },
                        //   child: Obx(() {
                        //     return Badge(
                        //       position: BadgePosition.topEnd(top: -8, end: 3),
                        //       animationDuration:
                        //           const Duration(milliseconds: 300),
                        //       animationType: BadgeAnimationType.slide,
                        //       badgeContent: Text(
                        //         cartController.quantity().toString(),
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //       child: InkWell(
                        //         onTap: () {
                        //           Get.toNamed(RoutesConst.cart);
                        //         },
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(50),
                        //             color: AppColors.mainColor,
                        //           ),
                        //           child: AppIcon(
                        //             icon: Icons.add_shopping_cart_outlined,
                        //             //color: Colors.white,
                        //             size: Dimensions.height35 + 8,
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   }),
                        // ) // child: AppIcon(icon: Icons.add_shopping_cart_outlined))
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(20),
                      child: Container(
                        // height: Dimensions.screenHeight/2.5,
                        child: BigText(
                          fontFamily: 'Cairo',
                          align: TextAlign.center,
                          text: productController
                              .allProductList[widget.pageId].name,
                          size: Dimensions.font23,
                        ),
                        width: double.maxFinite,

                        padding: EdgeInsets.only(bottom: Dimensions.height5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              topRight: Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    pinned: true,
                    expandedHeight: Dimensions.screenHeight / 1.43,
                    backgroundColor: AppColors.yellowColor,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                      children: [
                        // SizedBox(
                        // height: Dimensions.pageView,
                        // child: PageView.builder(
                        // controller: pageController,
                        // itemCount: productController
                        //     .allProductList[widget.pageId].images.length,
                        // itemBuilder: (context, position) {
                        //_currPageValue=position as double;
                        CarouselSlider.builder(
                          carouselController: carouselController,
                          options: CarouselOptions(
                              height: Dimensions.screenHeight / 1.70,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlayInterval: const Duration(seconds: 2),
                              viewportFraction: 1,
                              onPageChanged: (index, reson) {
                                setState(() {
                                  currentPage = index;
                                });
                              }),
                          itemCount: productController
                              .allProductList[widget.pageId].images.length,
                          itemBuilder: (context, index, realIndex) {
                            return InkWell(
                              onTap: () {
                                Get.to(ImageBigger(
                                  iamge: productController
                                      .allProductList[widget.pageId]
                                      .images[index]
                                      .url,
                                ));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(productController
                                        .allProductList[widget.pageId]
                                        .images[index]
                                        .url),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            );
                          },
                        ),
                        // }),
                        // ),

                        //dots
                        DotsIndicator(
                          dotsCount: productController
                              .allProductList[widget.pageId].images.length,
                          position: currentPage.toDouble(),
                          decorator: DotsDecorator(
                            size: const Size.square(9.0),
                            activeColor: AppColors.mainColor,
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ],
                    )),
                  ),
                  SliverToBoxAdapter(
                      child: Column(
                    children: [
                      Container(
                        child: ExpandableText(
                          text: productController
                              .allProductList[widget.pageId].description,
                        ),
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                ),
                // child: Padding(
                //   padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           // productController.setQuantity(false);
                //           // cartController.removeFromCart(
                //           //     productController.productList[widget.pageId]);
                //           if (cartController.quantityDateli > 1) {
                //             cartController.quantityDateli--;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t reduce more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.remove,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //       GestureDetector(onTap: () {
                //         //cartController.addProductToCart(product);
                //         //catrControler.addProduct(product);
                //       }, child: Obx(() {
                //         return BigText(
                //           text:
                //           "${(productController.allProductList[widget.pageId].price)} LE" +
                //               " X " +
                //               "${cartController.quantityDateli}",
                //           color: AppColors.mainBlackColor,
                //           size: Dimensions.font23,
                //         );
                //       })),
                //       GestureDetector(
                //         onTap: () {
                //           if (cartController.quantityDateli < 20) {
                //             cartController.quantityDateli++;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t add more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.add,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
              Container(
                //height: Dimensions.height125,
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: Dimensions.height120,
                        width: Dimensions.height120,
                        // padding: EdgeInsets.only(
                        //     top: Dimensions.height10,
                        //     bottom: Dimensions.height10,
                        //     left: Dimensions.width20,
                        //     right: Dimensions.width20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        //productController.isFavorites(productController.productList[widget.pageId].id)? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color:Colors.red);
                        child: Obx(() {
                          return IconButton(
                              onPressed: () {
                                favoriteController.manageFavorites(
                                    0,
                                    widget.pageId,
                                    productController
                                        .allProductList[widget.pageId].id);
                                // productController.isFavorites(
                                //     productController.allProductList[widget.pageId].id)
                                //     ? Get.snackbar(
                                //     'Favorite', 'Favorite added Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white)
                                //     : Get.snackbar('Favorite',
                                //     'Favorite deleted Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white);
                              },
                              icon: favoriteController.isFavorites(
                                      productController
                                          .allProductList[widget.pageId].id)
                                  ? Icon(
                                      Icons.favorite,
                                      color: AppColors.mainColor,
                                      size: 25,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      size: 25,
                                    ));
                        })),
                    InkWell(
                      onTap: () {
                        cartController.addToCart(
                            productController.allProductList[widget.pageId]);
                        //Get.toNamed(RoutesConst.cart);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height18,
                            bottom: Dimensions.height18,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Obx(() {
                          return BigText(
                            text:
                                " اضافة الى السلة  |  ${productController.allProductList[widget.pageId].price}  ج.م   ",
                            fontFamily: 'Cairo',
                            size: Dimensions.font16,
                            color: Colors.white,
                          );
                        }),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
    } else if (widget.listIndex == 1) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 70,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child:
                              Container(child: AppIcon(icon: Icons.arrow_back)),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        // GestureDetector(
                        //   // onTap: () {
                        //   //   // Get.toNamed(RouteHelper.getCartPage());
                        //   // },
                        //   child: Obx(() {
                        //     return Badge(
                        //       position: BadgePosition.topEnd(top: -8, end: 3),
                        //       animationDuration:
                        //           const Duration(milliseconds: 300),
                        //       animationType: BadgeAnimationType.slide,
                        //       badgeContent: Text(
                        //         cartController.quantity().toString(),
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //       child: InkWell(
                        //         onTap: () {
                        //           Get.toNamed(RoutesConst.cart);
                        //         },
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(50),
                        //             color: AppColors.mainColor,
                        //           ),
                        //           child: AppIcon(
                        //             icon: Icons.add_shopping_cart_outlined,
                        //             //color: Colors.white,
                        //             size: Dimensions.height35 + 8,
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   }),
                        // ) // child: AppIcon(icon: Icons.add_shopping_cart_outlined))
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(20),
                      child: Container(
                        // height: Dimensions.screenHeight/2.5,
                        child: BigText(
                          fontFamily: 'Cairo',
                          align: TextAlign.center,
                          text: productController
                              .hotProductList[widget.pageId].name,
                          size: Dimensions.font23,
                        ),
                        width: double.maxFinite,

                        padding: EdgeInsets.only(bottom: Dimensions.height5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              topRight: Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    pinned: true,
                    expandedHeight: Dimensions.screenHeight / 1.43,
                    backgroundColor: AppColors.yellowColor,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                      children: [
                        // SizedBox(
                        // height: Dimensions.pageView,
                        // child: PageView.builder(
                        // controller: pageController,
                        // itemCount: productController
                        //     .hotProductList[widget.pageId].images.length,
                        // itemBuilder: (context, position) {
                        //_currPageValue=position as double;
                        CarouselSlider.builder(
                          carouselController: carouselController,
                          options: CarouselOptions(
                              height: Dimensions.screenHeight / 1.70,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlayInterval: const Duration(seconds: 2),
                              viewportFraction: 1,
                              onPageChanged: (index, reson) {
                                setState(() {
                                  currentPage = index;
                                });
                              }),
                          itemCount: productController
                              .hotProductList[widget.pageId].images.length,
                          itemBuilder: (context, index, realIndex) {
                            return InkWell(
                              onTap: () {
                                Get.to(ImageBigger(
                                  iamge: productController
                                      .hotProductList[widget.pageId]
                                      .images[index]
                                      .url,
                                ));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(productController
                                        .hotProductList[widget.pageId]
                                        .images[index]
                                        .url),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            );
                          },
                        ),
                        // }),
                        // ),

                        //dots
                        DotsIndicator(
                          dotsCount: productController
                              .hotProductList[widget.pageId].images.length,
                          position: currentPage.toDouble(),
                          decorator: DotsDecorator(
                            size: const Size.square(9.0),
                            activeColor: AppColors.mainColor,
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ],
                    )),
                  ),
                  SliverToBoxAdapter(
                      child: Column(
                    children: [
                      Container(
                        child: ExpandableText(
                          text: productController
                              .hotProductList[widget.pageId].description,
                        ),
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                ),
                // child: Padding(
                //   padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           // productController.setQuantity(false);
                //           // cartController.removeFromCart(
                //           //     productController.productList[widget.pageId]);
                //           if (cartController.quantityDateli > 1) {
                //             cartController.quantityDateli--;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t reduce more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.remove,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //       GestureDetector(onTap: () {
                //         //cartController.addProductToCart(product);
                //         //catrControler.addProduct(product);
                //       }, child: Obx(() {
                //         return BigText(
                //           text:
                //           "${(productController.hotProductList[widget.pageId].price)} LE" +
                //               " X " +
                //               "${cartController.quantityDateli}",
                //           color: AppColors.mainBlackColor,
                //           size: Dimensions.font23,
                //         );
                //       })),
                //       GestureDetector(
                //         onTap: () {
                //           if (cartController.quantityDateli < 20) {
                //             cartController.quantityDateli++;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t add more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.add,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
              Container(
                // height: Dimensions.height125,
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: Dimensions.height120,
                        width: Dimensions.height120,
                        // padding: EdgeInsets.only(
                        //     top: Dimensions.height10,
                        //     bottom: Dimensions.height10,
                        //     left: Dimensions.width20,
                        //     right: Dimensions.width20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        //productController.isFavorites(productController.productList[widget.pageId].id)? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color:Colors.red);
                        child: Obx(() {
                          return IconButton(
                              onPressed: () {
                                favoriteController.manageFavorites(
                                    1,
                                    widget.pageId,
                                    productController
                                        .hotProductList[widget.pageId].id);
                                // productController.isFavorites(
                                //     productController.hotProductList[widget.pageId].id)
                                //     ? Get.snackbar(
                                //     'Favorite', 'Favorite added Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white)
                                //     : Get.snackbar('Favorite',
                                //     'Favorite deleted Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white);
                              },
                              icon: favoriteController.isFavorites(
                                      productController
                                          .hotProductList[widget.pageId].id)
                                  ? Icon(
                                      Icons.favorite,
                                      color: AppColors.mainColor,
                                      size: 25,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      size: 25,
                                    ));
                        })),
                    InkWell(
                      onTap: () {
                        cartController.addToCart(
                            productController.hotProductList[widget.pageId]);
                        //Get.toNamed(RoutesConst.cart);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height18,
                            bottom: Dimensions.height18,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Obx(() {
                          return BigText(
                            text:
                                " اضافة الى السلة  |  ${productController.hotProductList[widget.pageId].price}  ج.م   ",
                            fontFamily: 'Cairo',
                            size: Dimensions.font16,
                            color: Colors.white,
                          );
                        }),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
    }else if (widget.listIndex == 3) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 70,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child:
                          Container(child: AppIcon(icon: Icons.arrow_back)),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        GestureDetector(
                          // onTap: () {
                          //   // Get.toNamed(RouteHelper.getCartPage());
                          // },
                          child: Obx(() {

                              return badges.Badge(
                                position: badges.BadgePosition.topEnd(top: -8, end: 3),
                                badgeAnimation:const badges.BadgeAnimation.rotation(
                                  animationDuration: Duration(milliseconds: 300),),
                                // animationType: badges.BadgeAnimationType.slide,
                                badgeContent: Text(
                                  cartController.quantity().toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(RoutesConst.cart);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.mainColor,
                                    ),
                                    child: AppIcon(
                                      icon: Icons.add_shopping_cart_outlined,
                                      //color: Colors.white,
                                      size: Dimensions.height35 + 8,
                                    ),
                                  ),
                                ),
                              );

                          }),
                        ) // child: AppIcon(icon: Icons.add_shopping_cart_outlined))
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(20),
                      child: Container(
                        // height: Dimensions.screenHeight/2.5,
                        child: BigText(
                          fontFamily: 'Cairo',
                          align: TextAlign.center,
                          text: productController
                              .newProductList[widget.pageId].name,
                          size: Dimensions.font23,
                        ),
                        width: double.maxFinite,

                        padding: EdgeInsets.only(bottom: Dimensions.height5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              topRight: Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    pinned: true,
                    expandedHeight: Dimensions.screenHeight / 1.43,
                    backgroundColor: AppColors.yellowColor,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          children: [
                            // SizedBox(
                            // height: Dimensions.pageView,
                            // child: PageView.builder(
                            // controller: pageController,
                            // itemCount: productController
                            //     .hotProductList[widget.pageId].images.length,
                            // itemBuilder: (context, position) {
                            //_currPageValue=position as double;
                            CarouselSlider.builder(
                              carouselController: carouselController,
                              options: CarouselOptions(
                                  height: Dimensions.screenHeight / 1.70,
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  autoPlayInterval: const Duration(seconds: 2),
                                  viewportFraction: 1,
                                  onPageChanged: (index, reson) {
                                    setState(() {
                                      currentPage = index;
                                    });
                                  }),
                              itemCount: productController
                                  .newProductList[widget.pageId].images.length,
                              itemBuilder: (context, index, realIndex) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(ImageBigger(
                                      iamge: productController
                                          .newProductList[widget.pageId]
                                          .images[index]
                                          .url,
                                    ));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(productController
                                            .newProductList[widget.pageId]
                                            .images[index]
                                            .url),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                );
                              },
                            ),
                            // }),
                            // ),

                            //dots
                            DotsIndicator(
                              dotsCount: productController
                                  .newProductList[widget.pageId].images.length,
                              position: currentPage.toDouble(),
                              decorator: DotsDecorator(
                                size: const Size.square(9.0),
                                activeColor: AppColors.mainColor,
                                activeSize: const Size(18.0, 9.0),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            child: ExpandableText(
                              text: productController
                                  .newProductList[widget.pageId].description,
                            ),
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                ),
                // child: Padding(
                //   padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           // productController.setQuantity(false);
                //           // cartController.removeFromCart(
                //           //     productController.productList[widget.pageId]);
                //           if (cartController.quantityDateli > 1) {
                //             cartController.quantityDateli--;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t reduce more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.remove,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //       GestureDetector(onTap: () {
                //         //cartController.addProductToCart(product);
                //         //catrControler.addProduct(product);
                //       }, child: Obx(() {
                //         return BigText(
                //           text:
                //           "${(productController.newProductList[widget.pageId].price)} LE" +
                //               " X " +
                //               "${cartController.quantityDateli}",
                //           color: AppColors.mainBlackColor,
                //           size: Dimensions.font23,
                //         );
                //       })),
                //       GestureDetector(
                //         onTap: () {
                //           if (cartController.quantityDateli < 20) {
                //             cartController.quantityDateli++;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t add more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.add,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
              Container(
                // height: Dimensions.height125,
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: Dimensions.height120,
                        width: Dimensions.height120,
                        // padding: EdgeInsets.only(
                        //     top: Dimensions.height10,
                        //     bottom: Dimensions.height10,
                        //     left: Dimensions.width20,
                        //     right: Dimensions.width20),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        //productController.isFavorites(productController.productList[widget.pageId].id)? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color:Colors.red);
                        child: Obx(() {
                          return IconButton(
                              onPressed: () {
                                favoriteController.manageFavorites(
                                    3,
                                    widget.pageId,
                                    productController
                                        .newProductList[widget.pageId].id);
                                // productController.isFavorites(
                                //     productController.newProductList[widget.pageId].id)
                                //     ? Get.snackbar(
                                //     'Favorite', 'Favorite added Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white)
                                //     : Get.snackbar('Favorite',
                                //     'Favorite deleted Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white);
                              },
                              icon: favoriteController.isFavorites(
                                  productController
                                      .newProductList[widget.pageId].id)
                                  ? Icon(
                                Icons.favorite,
                                color: AppColors.mainColor,
                                size: 25,
                              )
                                  : const Icon(
                                Icons.favorite_border,
                                size: 25,
                              ));
                        })),
                    InkWell(
                      onTap: () {
                        cartController.addToCart(
                            productController.newProductList[widget.pageId]);
                        //Get.toNamed(RoutesConst.cart);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height18,
                            bottom: Dimensions.height18,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Obx(() {
                          return BigText(
                            text:
                            " اضافة الى السلة  |  ${productController.newProductList[widget.pageId].price}  ج.م   ",
                            fontFamily: 'Cairo',
                            size: Dimensions.font16,
                            color: Colors.white,
                          );
                        }),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
    }

    else if (widget.listIndex == 7) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 70,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child:
                              Container(child: AppIcon(icon: Icons.arrow_back)),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        GestureDetector(
                          // onTap: () {
                          //   // Get.toNamed(RouteHelper.getCartPage());
                          // },
                          child:Obx(() {

                            return badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -8, end: 3),
                              badgeAnimation:const badges.BadgeAnimation.rotation(
                                animationDuration: Duration(milliseconds: 300),),
                              // animationType: badges.BadgeAnimationType.slide,
                              badgeContent: Text(
                                cartController.quantity().toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(RoutesConst.cart);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.mainColor,
                                  ),
                                  child: AppIcon(
                                    icon: Icons.add_shopping_cart_outlined,
                                    //color: Colors.white,
                                    size: Dimensions.height35 + 8,
                                  ),
                                ),
                              ),
                            );

                          }),
                        ) // child: AppIcon(icon: Icons.add_shopping_cart_outlined))
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(20),
                      child: Container(
                        // height: Dimensions.screenHeight/2.5,
                        child: BigText(
                          fontFamily: 'Cairo',
                          align: TextAlign.center,
                          text:
                              productController.searchList[widget.pageId].name,
                          size: Dimensions.font23,
                        ),
                        width: double.maxFinite,

                        padding: EdgeInsets.only(bottom: Dimensions.height5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              topRight: Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    pinned: true,
                    expandedHeight: Dimensions.screenHeight / 1.43,
                    backgroundColor: AppColors.yellowColor,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                      children: [
                        // SizedBox(
                        // height: Dimensions.pageView,
                        // child: PageView.builder(
                        // controller: pageController,
                        // itemCount: productController
                        //     .searchList[widget.pageId].images.length,
                        // itemBuilder: (context, position) {
                        //_currPageValue=position as double;
                        CarouselSlider.builder(
                          carouselController: carouselController,
                          options: CarouselOptions(
                              height: Dimensions.screenHeight / 1.70,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlayInterval: const Duration(seconds: 2),
                              viewportFraction: 1,
                              onPageChanged: (index, reson) {
                                setState(() {
                                  currentPage = index;
                                });
                              }),
                          itemCount: productController
                              .searchList[widget.pageId].images.length,
                          itemBuilder: (context, index, realIndex) {
                            return InkWell(
                              onTap: () {
                                Get.to(ImageBigger(
                                  iamge: productController
                                      .searchList[widget.pageId]
                                      .images[index]
                                      .url,
                                ));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(productController
                                        .searchList[widget.pageId]
                                        .images[index]
                                        .url),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            );
                          },
                        ),
                        // }),
                        // ),

                        //dots
                        DotsIndicator(
                          dotsCount: productController
                              .searchList[widget.pageId].images.length,
                          position: currentPage.toDouble(),
                          decorator: DotsDecorator(
                            size: const Size.square(9.0),
                            activeColor: AppColors.mainColor,
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ],
                    )),
                  ),
                  SliverToBoxAdapter(
                      child: Column(
                    children: [
                      Container(
                        child: ExpandableText(
                          text: productController
                              .searchList[widget.pageId].description,
                        ),
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                ),
                // child: Padding(
                //   padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           // productController.setQuantity(false);
                //           // cartController.removeFromCart(
                //           //     productController.productList[widget.pageId]);
                //           if (cartController.quantityDateli > 1) {
                //             cartController.quantityDateli--;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t reduce more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.remove,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //       GestureDetector(onTap: () {
                //         //cartController.addProductToCart(product);
                //         //catrControler.addProduct(product);
                //       }, child: Obx(() {
                //         return BigText(
                //           text:
                //           "${(productController.searchList[widget.pageId].price)} LE" +
                //               " X " +
                //               "${cartController.quantityDateli}",
                //           color: AppColors.mainBlackColor,
                //           size: Dimensions.font23,
                //         );
                //       })),
                //       GestureDetector(
                //         onTap: () {
                //           if (cartController.quantityDateli < 20) {
                //             cartController.quantityDateli++;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t add more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.add,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
              Container(
                // height: Dimensions.height125,
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: Dimensions.height120,
                        width: Dimensions.height120,
                        // padding: EdgeInsets.only(
                        //     top: Dimensions.height10,
                        //     bottom: Dimensions.height10,
                        //     left: Dimensions.width20,
                        //     right: Dimensions.width20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        //productController.isFavorites(productController.productList[widget.pageId].id)? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color:Colors.red);
                        child: Obx(() {
                          return IconButton(
                              onPressed: () {
                                favoriteController.manageFavorites(
                                    7,
                                    widget.pageId,
                                    productController
                                        .searchList[widget.pageId].id);
                                // productController.isFavorites(
                                //     productController.searchList[widget.pageId].id)
                                //     ? Get.snackbar(
                                //     'Favorite', 'Favorite added Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white)
                                //     : Get.snackbar('Favorite',
                                //     'Favorite deleted Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white);
                              },
                              icon: favoriteController.isFavorites(
                                      productController
                                          .searchList[widget.pageId].id)
                                  ? Icon(
                                      Icons.favorite,
                                      color: AppColors.mainColor,
                                      size: 25,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      size: 25,
                                    ));
                        })),
                    InkWell(
                      onTap: () {
                        cartController.addToCart(
                            productController.searchList[widget.pageId]);
                        //Get.toNamed(RoutesConst.cart);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height18,
                            bottom: Dimensions.height18,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Obx(() {
                          return BigText(
                            text:
                                " اضافة الى السلة  |  ${productController.searchList[widget.pageId].price}  ج.م   ",
                            fontFamily: 'Cairo',
                            size: Dimensions.font16,
                            color: Colors.white,
                          );
                        }),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
    } else if (widget.listIndex == 8) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 70,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child:
                              Container(child: AppIcon(icon: Icons.arrow_back)),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        GestureDetector(
                          // onTap: () {
                          //   // Get.toNamed(RouteHelper.getCartPage());
                          // },
                          child: Obx(() {

                            return badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -8, end: 3),
                              badgeAnimation:const badges.BadgeAnimation.rotation(
                                animationDuration: Duration(milliseconds: 300),),
                              // animationType: badges.BadgeAnimationType.slide,
                              badgeContent: Text(
                                cartController.quantity().toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(RoutesConst.cart);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.mainColor,
                                  ),
                                  child: AppIcon(
                                    icon: Icons.add_shopping_cart_outlined,
                                    //color: Colors.white,
                                    size: Dimensions.height35 + 8,
                                  ),
                                ),
                              ),
                            );

                          }),
                        ) // child: AppIcon(icon: Icons.add_shopping_cart_outlined))
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(20),
                      child: Container(
                        // height: Dimensions.screenHeight/2.5,
                        child: BigText(
                          fontFamily: 'Cairo',
                          align: TextAlign.center,
                          text: productController
                              .catProductList[widget.pageId].name,
                          size: Dimensions.font23,
                        ),
                        width: double.maxFinite,

                        padding: EdgeInsets.only(bottom: Dimensions.height5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              topRight: Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    pinned: true,
                    expandedHeight: Dimensions.screenHeight / 1.43,
                    backgroundColor: AppColors.yellowColor,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                      children: [
                        // SizedBox(
                        // height: Dimensions.pageView,
                        // child: PageView.builder(
                        // controller: pageController,
                        // itemCount: productController
                        //     .catProductList[widget.pageId].images.length,
                        // itemBuilder: (context, position) {
                        //_currPageValue=position as double;
                        CarouselSlider.builder(
                          carouselController: carouselController,
                          options: CarouselOptions(
                              height: Dimensions.screenHeight / 1.70,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlayInterval: const Duration(seconds: 2),
                              viewportFraction: 1,
                              onPageChanged: (index, reson) {
                                setState(() {
                                  currentPage = index;
                                });
                              }),
                          itemCount: productController
                              .catProductList[widget.pageId].images.length,
                          itemBuilder: (context, index, realIndex) {
                            return InkWell(
                              onTap: () {
                                Get.to(ImageBigger(
                                  iamge: productController
                                      .catProductList[widget.pageId]
                                      .images[index]
                                      .url,
                                ));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(productController
                                        .catProductList[widget.pageId]
                                        .images[index]
                                        .url),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            );
                          },
                        ),
                        // }),
                        // ),

                        //dots
                        DotsIndicator(
                          dotsCount: productController
                              .catProductList[widget.pageId].images.length,
                          position: currentPage.toDouble(),
                          decorator: DotsDecorator(
                            size: const Size.square(9.0),
                            activeColor: AppColors.mainColor,
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ],
                    )),
                  ),
                  SliverToBoxAdapter(
                      child: Column(
                    children: [
                      Container(
                        child: ExpandableText(
                          text: productController
                              .catProductList[widget.pageId].description,
                        ),
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                ),
                // child: Padding(
                //   padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           // productController.setQuantity(false);
                //           // cartController.removeFromCart(
                //           //     productController.productList[widget.pageId]);
                //           if (cartController.quantityDateli > 1) {
                //             cartController.quantityDateli--;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t reduce more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.remove,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //       GestureDetector(onTap: () {
                //         //cartController.addProductToCart(product);
                //         //catrControler.addProduct(product);
                //       }, child: Obx(() {
                //         return BigText(
                //           text:
                //           "${(productController.catProductList[widget.pageId].price)} LE" +
                //               " X " +
                //               "${cartController.quantityDateli}",
                //           color: AppColors.mainBlackColor,
                //           size: Dimensions.font23,
                //         );
                //       })),
                //       GestureDetector(
                //         onTap: () {
                //           if (cartController.quantityDateli < 20) {
                //             cartController.quantityDateli++;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t add more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.add,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
              Container(
                // height: Dimensions.height125,
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: Dimensions.height120,
                        width: Dimensions.height120,
                        // padding: EdgeInsets.only(
                        //     top: Dimensions.height10,
                        //     bottom: Dimensions.height10,
                        //     left: Dimensions.width20,
                        //     right: Dimensions.width20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        //productController.isFavorites(productController.productList[widget.pageId].id)? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color:Colors.red);
                        child: Obx(() {
                          return IconButton(
                              onPressed: () {
                                favoriteController.manageFavorites(
                                    8,
                                    widget.pageId,
                                    productController
                                        .catProductList[widget.pageId].id);
                                // productController.isFavorites(
                                //     productController.catProductList[widget.pageId].id)
                                //     ? Get.snackbar(
                                //     'Favorite', 'Favorite added Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white)
                                //     : Get.snackbar('Favorite',
                                //     'Favorite deleted Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white);
                              },
                              icon: favoriteController.isFavorites(
                                      productController
                                          .catProductList[widget.pageId].id)
                                  ? Icon(
                                      Icons.favorite,
                                      color: AppColors.mainColor,
                                      size: 25,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      size: 25,
                                    ));
                        })),
                    InkWell(
                      onTap: () {
                        cartController.addToCart(
                            productController.catProductList[widget.pageId]);
                        //Get.toNamed(RoutesConst.cart);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height18,
                            bottom: Dimensions.height18,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Obx(() {
                          return BigText(
                            text:
                                " اضافة الى السلة  |  ${productController.catProductList[widget.pageId].price}  ج.م   ",
                            fontFamily: 'Cairo',
                            size: Dimensions.font16,
                            color: Colors.white,
                          );
                        }),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
    } else if (widget.listIndex == 9) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 70,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child:
                            Container(child: AppIcon(icon: Icons.arrow_back)),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      GestureDetector(
                        // onTap: () {
                        //   // Get.toNamed(RouteHelper.getCartPage());
                        // },
                        child: Obx(() {

                          return badges.Badge(
                            position: badges.BadgePosition.topEnd(top: -8, end: 3),
                            badgeAnimation:const badges.BadgeAnimation.rotation(
                              animationDuration: Duration(milliseconds: 300),),
                            // animationType: badges.BadgeAnimationType.slide,
                            badgeContent: Text(
                              cartController.quantity().toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(RoutesConst.cart);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.mainColor,
                                ),
                                child: AppIcon(
                                  icon: Icons.add_shopping_cart_outlined,
                                  //color: Colors.white,
                                  size: Dimensions.height35 + 8,
                                ),
                              ),
                            ),
                          );

                        }),
                      ) // child: AppIcon(icon: Icons.add_shopping_cart_outlined))
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(20),
                    child: Container(
                      // height: Dimensions.screenHeight/2.5,
                      child: BigText(
                        fontFamily: 'Cairo',
                        align: TextAlign.center,
                        text: favoriteController.favList[widget.pageId].name,
                        size: Dimensions.font23,
                      ),
                      width: double.maxFinite,
                      padding: EdgeInsets.only(bottom: Dimensions.height5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius20),
                            topRight: Radius.circular(Dimensions.radius20)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  pinned: true,
                  expandedHeight: Dimensions.screenHeight / 1.43,
                  backgroundColor: AppColors.yellowColor,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                    children: [
                      CarouselSlider.builder(
                        carouselController: carouselController,
                        options: CarouselOptions(
                            height: Dimensions.screenHeight / 1.70,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlayInterval: const Duration(seconds: 2),
                            viewportFraction: 1,
                            onPageChanged: (index, reson) {
                              setState(() {
                                _currPageValue = index.toDouble();
                              });
                            }),
                        itemCount:  favoriteController.favList[widget.pageId].images.length,
                        itemBuilder: (context, index, realIndex) {
                          return InkWell(
                            onTap: () {
                              Get.to(ImageBigger(
                                iamge: favoriteController
                                    .favList[widget.pageId].images[index].url,
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(favoriteController
                                      .favList[widget.pageId]
                                      .images[index]
                                      .url),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          );
                        },
                      ),

                      //dots
                      DotsIndicator(
                        dotsCount: favoriteController
                            .favList[widget.pageId].images.length,
                        position: _currPageValue,
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeColor: AppColors.mainColor,
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ],
                  )),
                ),
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    Container(
                      child: ExpandableText(
                        text: favoriteController
                            .favList[widget.pageId].description,
                      ),
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                    )
                  ],
                ))
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                ),
                // child: Padding(
                //   padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           // productController.setQuantity(false);
                //           // cartController.removeFromCart(
                //           //     productController.productList[widget.pageId]);
                //           if (cartController.quantityDateli > 1) {
                //             cartController.quantityDateli--;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t reduce more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.remove,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //       GestureDetector(onTap: () {
                //         //cartController.addProductToCart(product);
                //         //catrControler.addProduct(product);
                //       },
                //           child: Obx(() {
                //         return BigText(
                //           text:
                //           "${(productController.favList[widget.pageId].price)} LE" +
                //               " X " +
                //               "${cartController.quantityDateli}",
                //           color: AppColors.mainBlackColor,
                //           size: Dimensions.font23,
                //         );
                //       })
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           if (cartController.quantityDateli < 20) {
                //             cartController.quantityDateli++;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t add more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.add,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
              Container(
                // height: Dimensions.height125,
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Container(
                    //     height: Dimensions.height120,
                    //     width: Dimensions.height120,
                    //     // padding: EdgeInsets.only(
                    //     //     top: Dimensions.height10,
                    //     //     bottom: Dimensions.height10,
                    //     //     left: Dimensions.width20,
                    //     //     right: Dimensions.width20),
                    //     decoration: BoxDecoration(
                    //       borderRadius:
                    //       BorderRadius.circular(Dimensions.radius20),
                    //       color: Colors.white,
                    //     ),
                    //     child: Obx(() {
                    //       return IconButton(
                    //           onPressed: () {
                    //             productController.manageFavorites(9,widget.pageId,productController.favList[widget.pageId].product);
                    //
                    //           },
                    //           icon: productController.isFavorites(
                    //               productController.favList[widget.pageId].product)
                    //               ? Icon(
                    //             Icons.favorite,
                    //             color: AppColors.mainColor,
                    //             size: Dimensions.width20,
                    //           )
                    //               : Icon(
                    //             Icons.favorite_border,
                    //             size: Dimensions.width20,
                    //           ));
                    //     })),
                    InkWell(
                      onTap: () {
                        cartController.addToCart(
                            favoriteController.favList[widget.pageId]);

                        //Get.toNamed(RoutesConst.cart);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10,
                            bottom: Dimensions.height18,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Obx(() {
                          return Center(
                            child: BigText(
                              text:
                                  " اضافة الى السلة  |  ${cartController.quantityDateli * favoriteController.favList[widget.pageId].price}  ج.م   ",
                              fontFamily: 'Cairo',
                              size: Dimensions.font16,
                              color: Colors.white,
                            ),
                          );
                        }),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
    } else {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 70,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child:
                            Container(child: AppIcon(icon: Icons.arrow_back)),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      GestureDetector(
                        // onTap: () {
                        //   // Get.toNamed(RouteHelper.getCartPage());
                        // },
                        child: Obx(() {

                          return badges.Badge(
                            position: badges.BadgePosition.topEnd(top: -8, end: 3),
                            badgeAnimation:const badges.BadgeAnimation.rotation(
                              animationDuration: Duration(milliseconds: 300),),
                            // animationType: badges.BadgeAnimationType.slide,
                            badgeContent: Text(
                              cartController.quantity().toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(RoutesConst.cart);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.mainColor,
                                ),
                                child: AppIcon(
                                  icon: Icons.add_shopping_cart_outlined,
                                  //color: Colors.white,
                                  size: Dimensions.height35 + 8,
                                ),
                              ),
                            ),
                          );

                        }),
                      ) // child: AppIcon(icon: Icons.add_shopping_cart_outlined))
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(20),
                    child: Container(
                      // height: Dimensions.screenHeight/2.5,
                      child: BigText(
                        fontFamily: 'Cairo',
                        align: TextAlign.center,
                        text: productController
                            .allProductList[widget.pageId].name,
                        size: Dimensions.font23,
                      ),
                      width: double.maxFinite,
                      padding: EdgeInsets.only(bottom: Dimensions.height5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius20),
                            topRight: Radius.circular(Dimensions.radius20)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  pinned: true,
                  expandedHeight: Dimensions.height300,
                  backgroundColor: AppColors.yellowColor,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.pageView,
                        child: PageView.builder(
                            controller: pageController,
                            itemCount: productController
                                .allProductList[widget.pageId].images.length,
                            itemBuilder: (context, position) {
                              //_currPageValue=position as double;
                              return Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 70),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(ImageBigger(
                                            iamge: productController
                                                .allProductList[widget.pageId]
                                                .images[position]
                                                .url,
                                          ));
                                        },
                                        child: Container(
                                          height: Dimensions.pageViewContainer,
                                          margin: EdgeInsets.only(
                                            left: Dimensions.width10,
                                            right: Dimensions.width10,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius30),
                                              //color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                                              color: AppColors.yellowColor,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      productController
                                                          .allProductList[
                                                              widget.pageId]
                                                          .images[position]
                                                          .url))),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),

                      //dots
                      DotsIndicator(
                        dotsCount: productController
                            .allProductList[widget.pageId].images.length,
                        position: _currPageValue,
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeColor: AppColors.mainColor,
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ],
                  )),
                ),
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    Container(
                      child: ExpandableText(
                        text: productController
                            .allProductList[widget.pageId].description,
                      ),
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                    )
                  ],
                ))
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                ),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: AppColors.mainDarkColor,
                      );
                    }),
                // child: Padding(
                //   padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           // productController.setQuantity(false);
                //           // cartController.removeFromCart(
                //           //     productController.productList[widget.pageId]);
                //           if (cartController.quantityDateli > 1) {
                //             cartController.quantityDateli--;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t reduce more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.remove,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //       GestureDetector(onTap: () {
                //         //cartController.addProductToCart(product);
                //         //catrControler.addProduct(product);
                //       }, child: Obx(() {
                //         return BigText(
                //           text:
                //           "${(productController.allProductList[widget.pageId].price)} LE" +
                //               " X " +
                //               "${cartController.quantityDateli}",
                //           color: AppColors.mainBlackColor,
                //           size: Dimensions.font23,
                //         );
                //       })),
                //       GestureDetector(
                //         onTap: () {
                //           if (cartController.quantityDateli < 20) {
                //             cartController.quantityDateli++;
                //           } else {
                //             Get.snackbar('Item Quint', 'You Can\'t add more!',
                //                 backgroundColor: AppColors.mainColor,
                //                 colorText: Colors.white);
                //           }
                //         },
                //         child: AppIcon(
                //           icon: Icons.add,
                //           backgroundColor: AppColors.mainColor,
                //           iconColor: Colors.white,
                //           iconSize: Dimensions.iconSize15,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
              Container(
                // height: Dimensions.height125,
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: Dimensions.height120,
                        width: Dimensions.height120,
                        // padding: EdgeInsets.only(
                        //     top: Dimensions.height10,
                        //     bottom: Dimensions.height10,
                        //     left: Dimensions.width20,
                        //     right: Dimensions.width20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        //productController.isFavorites(productController.productList[widget.pageId].id)? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color:Colors.red);
                        child: Obx(() {
                          return IconButton(
                              onPressed: () {
                                favoriteController.manageFavorites(
                                    11,
                                    widget.pageId,
                                    productController
                                        .allProductList[widget.pageId].id);
                                // productController.isFavorites(
                                //     productController.allProductList[widget.pageId].id)
                                //     ? Get.snackbar(
                                //     'Favorite', 'Favorite added Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white)
                                //     : Get.snackbar('Favorite',
                                //     'Favorite deleted Successfully',
                                //     backgroundColor: AppColors.mainColor,
                                //     colorText: Colors.white);
                              },
                              icon: favoriteController.isFavorites(
                                      productController
                                          .allProductList[widget.pageId].id)
                                  ? Icon(
                                      Icons.favorite,
                                      color: AppColors.mainColor,
                                      size: 25,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      size: 25,
                                    ));
                        })),
                    InkWell(
                      onTap: () {
                        cartController.addToCart(
                            productController.allProductList[widget.pageId]);
                        //Get.toNamed(RoutesConst.cart);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height18,
                            bottom: Dimensions.height18,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Obx(() {
                          return BigText(
                            text:
                                " اضافة الى السلة  |  ${cartController.quantityDateli * productController.allProductList[widget.pageId].price}  ج.م   ",
                            fontFamily: 'Cairo',
                            size: Dimensions.font16,
                            color: Colors.white,
                          );
                        }),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
    }
  }

  // Widget _buildPageItem(int index) {
  //   return
  // }
}
