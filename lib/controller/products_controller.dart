import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tsouq/core/services/category_service.dart';
import 'package:tsouq/core/services/product_by_category_service.dart';
import 'package:tsouq/core/services/product_sevice.dart';
import 'package:tsouq/data/model/categories_model.dart';
import 'package:tsouq/data/model/fav_response_model.dart';
import '../core/services/fav_service.dart';
import '../data/model/get_fav_model.dart';
import '../data/model/products_model.dart';

class ProductsController extends GetxController {
  var allProductList = <dynamic>[].obs;
  var hotProductList = <dynamic>[].obs;
  var newProductList = <dynamic>[].obs;
  late Favourite favourite;
  // var favoriteList = <Product>[].obs;
  var carousalList = <Carousel>[].obs;
  var searchList = <dynamic>[].obs;
  var categoryList = <MyCategory>[].obs;
  var catProductList = <dynamic>[].obs;
  var isLoading_products = true.obs;
  var isLoading_hot_products = true.obs;
  var isLoading_new_products = true.obs;
  var isLoading_productsByCat = true.obs;
  var isLoading_carosal = true.obs;
  var isLoading_category = true.obs;
  var storage = GetStorage();
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    //  print(storage.read<List>("isFavoritesList"));
    //   List? storedFavorites= storage.read<List>("isFavoritesList");
    //   if(storedFavorites!=null){
    //     favoriteList=storedFavorites.map((e) => Product.fromJson(e)).toList().obs;
    //     print(favoriteList.length);
    //   }
    getAllProducts();
    getHotProducts();
    getCarousal();
    getCategory();
    getNewProducts();
  }

  void getCategory() async {
    var category = await CategoryService.getCategories();
    // print(product.length);

    try {
      isLoading_category.value = true;
      if (category.category.isNotEmpty) {
        categoryList.addAll(category.category);
      }
    } finally {
      isLoading_category.value = false;
    }
  }

  Future getAllProducts() async {
    var product = await ProductService.getProducts();
    // print(product.length);

    try {
      isLoading_products.value = true;
      if (product.allProducts.isNotEmpty) {
        allProductList.addAll(product.allProducts);
      }
    } finally {

      isLoading_products.value = false;
    }
  }

  //get hot product
  Future getHotProducts() async {
    var product = await ProductService.getProducts();
    // print(product.length);

    try {
      isLoading_hot_products.value = true;
      if (product.allProducts.isNotEmpty) {
        hotProductList.addAll(product.hotProducts);
      }
    } finally {
      isLoading_hot_products.value = false;
    }
  }
  //get new product
  Future getNewProducts() async {
    var product = await ProductService.getProducts();
    // print(product.length);

    try {
      isLoading_new_products.value = true;
      if (product.newestProducts.isNotEmpty) {
        newProductList.addAll(product.newestProducts);
      }
    } finally {
      isLoading_new_products.value = false;
    }
  }
  getProductsByCategories(String categoryName) async {
    isLoading_productsByCat(true);
    catProductList.value =
        await ProductByCategoryService.getProductsByCategories(categoryName);
    isLoading_productsByCat(false);
  }

  getCategoryByIndex(int index) async {
    var nameCategory = await getProductsByCategories(categoryList[index].name);
    if (nameCategory != null) {
      catProductList.value = nameCategory;
    }
  }

  void getCarousal() async {
    var carousal = await ProductService.getProducts();
    // print(product.length);

    try {
      isLoading_carosal.value = true;
      if ( carousal.carousel.isNotEmpty) {
        carousalList.addAll(carousal.carousel);
      }
    } finally {
      isLoading_carosal.value = false;
    }
  }



  addToSearchLest(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = allProductList.where((search) {
      var searchTitle = search.name.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  void clearSearchList() {
    searchController.clear();
    addToSearchLest("");
  }





}
