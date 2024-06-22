import 'package:get/get.dart';
import 'package:tsouq/data/model/fav_response_model.dart';
import 'package:tsouq/data/model/products_model.dart';

import '../core/database_helper.dart';

class CartController extends GetxController{

  var productsMap={}.obs;
  RxInt quantityDateli=1.obs;

   void addToCart(dynamic product)async{
     // var dbHelper=DatabaseHelper.db;
     // await dbHelper.insert(product);
     // print('ok');
     if(productsMap.containsKey(product)){
       productsMap[product]+=1;
     }else{
       productsMap[product]=1;
     }

   }

   void removeFromCart(Product product){
     if(productsMap.containsKey(product)&&productsMap[product]==1){
       productsMap.removeWhere((key, value) => key==product);
     }else{
       productsMap[product]-=1;
     }
   }
   void removeOneProduct(dynamic product){
     productsMap.removeWhere((key, value) => key==product);
   }
   void clearAllProducts(){
    productsMap.clear();
}
   get productSubTotal=>productsMap.entries.map((e) => e.key.price*e.value).toList();
   get total=>productsMap.entries.map((e) => e.key.price*e.value).toList().reduce((value, element) => value+element).toStringAsFixed(2);
   get totalAfterShopping=>productsMap.entries.map((e) => e.key.price*e.value).toList().reduce((value, element) => (value+element)).toStringAsFixed(2);

    int quantity() {
      if(productsMap.isEmpty){
        return 0;
      }else {
        return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value+element);
      }

    }

}