
import 'package:http/http.dart' as http;
import 'package:tsouq/data/model/products_model.dart';
import 'package:tsouq/data/model/signal_product_model.dart';
import 'package:tsouq/utils/app_constants.dart';


class ProductService{
 static Future<Products> getProducts()async{
 var response= await  http.get(Uri.parse('${AppConstants.GET_ALL_PRODUCTS}'));
 if(response.statusCode==200 || response.statusCode==201){
  var jsonData= response.body;

  return productsModelFromJson(jsonData).products;
 }else{
return throw Exception("Failed to load product");
 }
  }



 // static  Future<SingleProductModel> getSingleProductsByID(String productId)async{
 //  var response= await  http.get(Uri.parse('https://emey-api.herokuapp.com/api/v1/product/$productId'));
 //  if(response.statusCode==200){
 //   var jsonData= response.body;
 //
 //   return singleProductModelFromJson(jsonData);
 //
 //  }else{
 //   return  throw Exception("Failed to load product");
 //  }
 // }




}