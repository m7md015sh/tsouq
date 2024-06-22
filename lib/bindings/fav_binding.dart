

import 'package:get/get.dart';

import '../controller/favorite_controller.dart';

class FavBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
  }

}