import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:tsouq/data/model/fav_response_model.dart';
import 'package:tsouq/data/model/get_fav_model.dart';
import 'package:tsouq/data/model/products_model.dart';
import 'package:tsouq/utils/app_constants.dart';
class GetFavService {

  static Future<List<Favourite>> getMyFav() async {
    var response = await http.get(
        Uri.parse('${AppConstants.BASE_URL}api/v1/favourite'), headers: {
      'Cookie': 'token=${AppConstants.TOKEN}',
      "Content-Type":"application/json",

    });
    if (response.statusCode == 200||response.statusCode==201) {
      var jsonData = response.body;
      return getFavModelFromJson(jsonData).favourites;
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
  class AddFav{
  Future<Favourite>postFav( String id)async{
  var token =AppConstants.TOKEN;
  //Map<String,String> headers={};
  //if(token!=null){
  // headers.addAll({
  // 'Cookie':'token=$token',
  // "Content-Type":"application/json",
  // });
 // }
  http.Response response=await http.post(Uri.parse('https://emey-api.herokuapp.com/api/v1/favourite/new'),body:json.encode({
    "product":id,
  }),headers: {
  'Cookie': 'token=$token',
  "Content-Type":"application/json",

  });
  //Map<String,dynamic> data=jsonDecode(response.body);
  if(response.statusCode==200)
  {
  var stringObject=response.body;
  var data=postFavResoonseModelFromJson(stringObject).favourite;
 //  print(data.length);
  return data;

  }else {
  return throw Exception("Failed to load product  ${response.body}    ${response.statusCode}");


  }

  }


  static Future deleteMyFav(String product) async {
    var response = await http.delete(
        Uri.parse('https://emey-api.herokuapp.com/api/v1/favourite/$product'), headers: {
      'Cookie': 'token=${AppConstants.TOKEN}',
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return jsonData;
    } else {
      return throw Exception("Failed to load product ${response.body }+ ${response.statusCode}");
    }
  }

}