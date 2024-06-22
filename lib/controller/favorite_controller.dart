import 'package:get/get.dart';
import 'package:tsouq/controller/cat_controller.dart';

import 'package:tsouq/controller/products_controller.dart';

import '../core/services/fav_service.dart';
import 'cat_controller.dart';


class FavoriteController extends GetxController{
  @override
  void onInit() {
    getFav();
    super.onInit();
  }

  var isLoading_my_fav = true.obs;
  var favList = <dynamic>[].obs;

  final productsController=Get.find<ProductsController>();

  //Logic add favorites
  void manageFavorites(int numList, int index, String productId) async {
    var existingIndex =
    favList.indexWhere((element) => element.product == productId);
    if (existingIndex >= 0) {
      favList.removeAt(existingIndex);
      await AddFav.deleteMyFav(productId);
      // await storage.remove("isFavoritesList");
    } else {
      isLoading_my_fav.value=true;


      try {

        var data;
        if (numList == 0) {
          data = await AddFav().postFav(productsController.allProductList[index].id);
          favList.add(data);
        }
        else if (numList == 1) {
          data = await AddFav().postFav(productsController.hotProductList[index].id);
          favList.add(data);
        }
        else if (numList == 3) {
          data = await AddFav().postFav(productsController.newProductList[index].id);
          favList.add(data);
        }
        else if (numList == 7) {
          data = await AddFav().postFav(productsController.searchList[index].id);
          favList.add(data);
        }
        else if (numList == 8) {
          data = await AddFav().postFav(productsController.catProductList[index].id);
          favList.add(data);
        }
        // else if (numList == 9) {
        //   data = await AddFav.deleteMyFav(productId);
        //   favList.add(data);
        // }



      } finally {
        isLoading_my_fav.value=false;

        // isLoading.value = false;

        //  isLoading.value = false;
      }

      //favList.add(await AddFav().postFav(name: allProductList[index].name, price: allProductList[index].price, ratings: allProductList[index].ratings, product: allProductList[index].id, image: allProductList[index].images[0].url));
      //await storage.write("isFavoritesList", favoriteList);

    }
  }

  bool isFavorites(String productId) {
    return favList.any((element) => element.product == productId);
  }

  Future getFav() async {
    var fav = await GetFavService.getMyFav();
    // print(product.length);

    try {
      isLoading_my_fav.value = true;
      if (fav.isNotEmpty) {
        favList.addAll(fav);

      }
    } finally {
      print('ffavvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv${favList.length}');
      isLoading_my_fav.value = false;
    }
  }

}