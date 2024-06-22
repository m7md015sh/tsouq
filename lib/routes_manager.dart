import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/bindings/all_order_binding.dart';
import 'package:tsouq/bindings/auth_binding.dart';
import 'package:tsouq/bindings/cart_binding.dart';
import 'package:tsouq/bindings/category_binging.dart';
import 'package:tsouq/bindings/fav_binding.dart';
import 'package:tsouq/bindings/login_binding.dart';
import 'package:tsouq/bindings/order_binding.dart';
import 'package:tsouq/bindings/products_pinding.dart';
import 'package:tsouq/bindings/register_binding.dart';
import 'package:tsouq/core/constant/routes_const.dart';
import 'package:tsouq/view/pages/auth/sign_in_page.dart';
import 'package:tsouq/view/pages/cart/cart_page.dart';
import 'package:tsouq/view/pages/category/caregory_screen.dart';
import 'package:tsouq/view/pages/favorites/favorites_screens.dart';
import 'package:tsouq/view/pages/home/home_page.dart';
import 'package:tsouq/view/pages/on_boarding.dart';
import 'package:tsouq/view/pages/search_screen.dart';
import 'package:tsouq/view/pages/splash_screen/splash_screen.dart';

import 'view/pages/all_view_product_page.dart';
import 'view/pages/auth/sign_up_page.dart';
import 'view/pages/order_page/OrderConfirmPage.dart';
import 'view/pages/order_page/TrackOrderPage.dart';
import 'view/pages/order_page/my_order_page.dart';
import 'view/pages/order_page/order_page.dart';

// Map<String, Widget Function(BuildContext)> routesManager={
//   RoutesConst.login:(context)=>SignInPage(),
//   RoutesConst.register:(context)=>SignUpPage(),
//
// };

class AppRoutes{
  //initialRoute
  static const onBoarding=RoutesConst.home;

  //get Pages
  static final routes=[
    GetPage(name: RoutesConst.onBoarding, page:()=> const OnBoarding()),
    GetPage(name: RoutesConst.login, page:()=>  SignInPage(),bindings: [LoginBinding(),AuthBinding(),ProductBinding(),]),
    GetPage(name: RoutesConst.register, page:()=>  SignUpPage(),bindings: [RegisterBinding(),AuthBinding(),ProductBinding(),]),
    GetPage(name: RoutesConst.home, page:()=>   HomePage(),bindings:[ ProductBinding(),CategoryBinding(),CartBinding(),AllOrdersBinding(),AuthBinding(),FavBinding()]),
    GetPage(name: RoutesConst.favorite, page:()=>   FavoritesScreens(),bindings: [ProductBinding(),AuthBinding(),FavBinding()]),
    GetPage(name: RoutesConst.categories, page:()=>   CategoryScreen(),binding: CategoryBinding()),
    GetPage(name: RoutesConst.cart, page:()=>   CartPage(),bindings: [CartBinding()]),
    GetPage(name: RoutesConst.search, page:()=>   SearchScreen(),bindings: [ ProductBinding(),]),
    GetPage(name: RoutesConst.orderPage, page:()=>  OrderPage(),bindings: [OrderBinding(),]),
    GetPage(name: RoutesConst.splash, page:()=>  SplashScreen(),bindings: [ LoginBinding(),RegisterBinding(),AuthBinding(),ProductBinding(),FavBinding()]),
    GetPage(name: RoutesConst.trackOrderPage, page:()=>  TrackOrderPage(),bindings: [OrderBinding(),AllOrdersBinding()]),
    GetPage(name: RoutesConst.orderConfirmed, page:()=>  OrderConfirmPage(),bindings: [OrderBinding(),AllOrdersBinding()]),
    GetPage(name: RoutesConst.myOrder, page:()=>  MyOrder(),bindings: [OrderBinding(),AllOrdersBinding()]),
    //GetPage(name: RoutesConst.allHot, page:()=>   AllHotProductPage(),bindings: [ProductBinding(),CartBinding()]),

  ];
}
