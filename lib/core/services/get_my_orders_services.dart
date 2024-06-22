import 'package:tsouq/data/model/get_my_orders_model.dart';
import 'package:http/http.dart'as http;
import 'package:tsouq/utils/app_constants.dart';
class GetMyOrdersService {
  static Future<GetMyOrdersModel> getMyOrders() async {


    var response = await http.get(

        Uri.parse('${AppConstants.BASE_URL}api/v1/orders/me'),headers: {
    'Cookie':'token=${AppConstants.TOKEN}',
    "Content-Type":"application/json",
    });
    if (response.statusCode == 200 || response.statusCode==201) {
      var jsonData = response.body;

      return getMyOrdersModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}