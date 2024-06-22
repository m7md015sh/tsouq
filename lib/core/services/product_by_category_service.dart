import 'package:tsouq/data/model/products_model.dart';
import 'package:http/http.dart' as http;
import 'package:tsouq/utils/app_constants.dart';

class ProductByCategoryService{
  static Future<List<Product>> getProductsByCategories(String categoryName)async{
    var response= await  http.get(Uri.parse('${AppConstants.BASE_URL}/api/v1/home?category=$categoryName'));
    if(response.statusCode==200 || response.statusCode==201){
      var jsonData= response.body;

      return productsModelFromJson(jsonData).products.allProducts;
    }else{
      return throw Exception("Failed to load product");
    }
  }
}