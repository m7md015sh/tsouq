import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsouq/controller/products_controller.dart';

class SearchFromText extends StatelessWidget {
  SearchFromText({Key? key}) : super(key: key);
  final controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.searchController,
      onChanged: (searchName) {
        controller.addToSearchLest(searchName);
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          prefixIcon: Icon(Icons.search),
          suffixIcon: controller.searchController.text.isNotEmpty?IconButton(
              onPressed: () {
                controller.clearSearchList();
              },
              icon: Icon(Icons.close)):null,
          hintText: 'search product or price'.tr,

          hintStyle: TextStyle(
              fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500),
          filled: true),
    );
  }
}
