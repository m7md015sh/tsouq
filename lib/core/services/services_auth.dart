import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:tsouq/data/model/auth_models/login_model.dart';
import 'package:tsouq/data/model/auth_models/register_model.dart';
import 'package:tsouq/utils/app_constants.dart';




class AuthServices{
 static var client=http.Client();
 static register({required name,required email,required password})async{
   var response=await client.post(Uri.parse("${AppConstants.BASE_URL}/api/v1/register"),
   headers: {'Content-Type':'application/json'},
   body: jsonEncode(<String,String>{"name":name,"email":email,"password":password}),
   );
   if(response.statusCode==200||response.statusCode==201)
   {
     var stringObject=response.body;
     var user=resisterModelFromJson(stringObject);
    return user;

   }else {
     return null;
   }

 }

 static login({required email,required password})async{
   var response=await client.post(Uri.parse("${AppConstants.BASE_URL}api/v1/login"),

     body: jsonEncode({"email":email,"password":password}),
   );

   if(response.statusCode==200)
   {
     var stringObject=response.body;
     print('========================================================');

     print(stringObject);
     print('========================================================');
     var user=loginModelFromJson(stringObject);
     return user;

   }else {
     return null;
   }

 }


 static logout()async{
   var response=await client.get(Uri.parse("${AppConstants.BASE_URL}/api/v1/logout"),
       headers: {
         'Cookie': 'token=${AppConstants.TOKEN}',
         "Content-Type": "application/json",
       }

   );
   if(response.statusCode==200)
   {
     var stringObject=response.body;
   //  var user=loginModelFromJson(stringObject);
     print("===========================================================");
     return stringObject;

   }else {
     return throw Exception("Failed to load product ${response.body }+ ${response.statusCode}");
   }

 }
}