import 'package:badges/badges.dart'as badges ;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tsouq/controller/cart_controller.dart';
import 'package:tsouq/core/constant/assets_image.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';
import 'package:tsouq/view/pages/home/product_page_body.dart';
import 'package:tsouq/view/widgets/app_icon.dart';
import 'package:tsouq/view/widgets/big_text.dart';
import 'package:tsouq/view/widgets/small_text.dart';

import '../../../controller/products_controller.dart';
import '../../widgets/carousal_widget.dart';
import '../../widgets/category_horizontal_widget.dart';

class MainProductPage extends StatefulWidget {
   MainProductPage({Key? key}) : super(key: key);

  @override
  _MainProductPageState createState() => _MainProductPageState();
}
final pageController = CarouselController();
var _currPageValue = 0;
class _MainProductPageState extends State<MainProductPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();
    final cartController = Get.find<CartController>();
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Image(image: AssetImage("assets/image/image_logo.png"),width: 30,height: 30,),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: BigText(
            text: 'Tsouq'.tr,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            size: Dimensions.font20,
            color: AppColors.mainDarkColor,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                        width: Dimensions.height45 ,
                        height: Dimensions.height35 ,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainDarkColor,
                        ),
                        child: IconButton(
                            onPressed: () {
                              Get.toNamed(RoutesConst.favorite);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: Dimensions.iconSize15,
                            ))),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Center(child:  Obx(() {
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
                  })),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children:  [
              Obx(() {
                return controller.isLoading_carosal.value == true
                    ? Container(
                  width: double.infinity,
                  height:Dimensions.screenHeight / 3,
                  child: Center(child: Lottie.asset(AppImageAsset.loadingApiLottie,width: Dimensions.height190,height: Dimensions.height190,)),
                )
                    : CarouselSlider.builder(
                    carouselController: pageController,
                    itemCount: controller.carousalList.length,
                    itemBuilder: (context, index, currentIndex) {
                      return CarousalWidget(
                          url: controller.carousalList[index].url);
                    },
                    options: CarouselOptions(
                      height: Dimensions.screenHeight / 3,
                      aspectRatio: 16 / 5,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 4),

                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.ease,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currPageValue = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ));
              }),
              //dots
              Obx(() {
                return controller.isLoading_carosal.value == true
                    ? Container()
                    : Center(
                  child: DotsIndicator(
                    dotsCount:controller.carousalList.length,
                    position: _currPageValue.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeColor: AppColors.mainColor,
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                );
              }),

              SizedBox(
                height: Dimensions.height5,
              ),
              //category text
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      BigText(
                        text: 'Categories'.tr,
                        fontFamily: 'Cairo',
                        color: AppColors.mainDarkColor,
                      ),

                    ],
                  )),
              SizedBox(
                height: Dimensions.height5,
              ),
              // Category section
              controller.isLoading_category.value==true?Container(
                width: double.infinity,
                height: Dimensions.height190,
                child: Center(child: Lottie.asset(AppImageAsset.loadingApiLottie,width: Dimensions.height190,height: Dimensions.height190,)),
              ):
              Container(
                width: double.infinity,
                height: Dimensions.height190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                ),

                child: Container(
                  width: Dimensions.width120,
                  height: Dimensions.height190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: ListView.separated(itemCount: controller.categoryList.length,scrollDirection: Axis.horizontal,itemBuilder: (context,index){
                    return

                      CategoryHorizontalWidget(index: index,controller: controller,);


                  },separatorBuilder: (context,index){
                    return SizedBox(width: 2,);
                  }),
                ),
              ),

              ProductPageBody()
            ],
          ),
        ));
  }
}
