import 'package:ecommerce_app_project/Model/get_carts_model.dart';
import 'package:ecommerce_app_project/View/Screens/cart_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AddOrRemoveCartApi extends GetxController {


  Future addOrRemoveCart(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try {
      var url = Uri.parse("https://student.valuxapps.com/api/carts");
      var response = await http.post(url, headers: {
        "lang": "ar",
        "Authorization": token,
      }, body: {
        "product_id": productId,
      });
      var responsebody = jsonDecode(response.body);
      print("message===>${responsebody}");
      String message = responsebody["message"];
      print("message===>${message}");
      return message;
    } catch (e) {
      print("Error===>$e");
    }
    update();
  }
}
