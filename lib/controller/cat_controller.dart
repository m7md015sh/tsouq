// import 'package:get/get.dart';
// import 'package:tsouq/core/services/product_by_category_service.dart';
// import 'package:tsouq/data/model/products_model.dart';
//
// import '../core/services/category_service.dart';
// import '../data/model/categories_model.dart';
//
// var categoryList = <MyCategory>[].obs;
// var catProductList = <Product>[].obs;
// var isLoading_category = true.obs;
// var isLoading_productsByCat = true.obs;
//
// class CategoryController extends GetxController{
//   @override
//   void onInit() {
//     super.onInit();
//
//   //  getCategory();
//
//   }
//   void getCategory() async {
//     var category = await CategoryService.getCategories();
//     // print(product.length);
//
//     try {
//       isLoading_category.value = true;
//       if (category.category.isNotEmpty) {
//         categoryList.addAll(category.category);
//       }
//     } finally {
//       isLoading_category.value = false;
//     }
//   }
//   getProductsByCategories(String categoryName) async {
//     isLoading_productsByCat(true);
//     catProductList.value =
//     (await ProductByCategoryService.getProductsByCategories(categoryName));
//     isLoading_productsByCat(false);
//   }
//
//   getCategoryByIndex(int index) async {
//     var nameCategory = await getProductsByCategories(categoryList[index].name);
//     if (nameCategory != null) {
//       catProductList.value = nameCategory;
//     }
//   }
//
// }