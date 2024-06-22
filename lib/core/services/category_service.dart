import 'package:http/http.dart' as http;
import 'package:tsouq/data/model/categories_model.dart';
import 'package:tsouq/utils/app_constants.dart';


class CategoryService{
  static Future<CategoriesModel> getCategories()async{
    var response= await  http.get(Uri.parse('${AppConstants.BASE_URL}/api/v1/category'));
    if(response.statusCode==200 || response.statusCode==201){
      var jsonData= response.body;


      return categoriesModelFromJson(jsonData);
    }else{
      print('error');
      return throw Exception("Failed to load categories");
    }
  }
}