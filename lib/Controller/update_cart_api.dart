import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_total_api.dart';
import 'get_carts_api.dart';

class UpdateCartApi extends GetxController{

  var check;

  int totalCart = 0;
  String quantity = '1';

  CartTotalApi cartTotal = Get.put(CartTotalApi());


  Future updateCart(int cartId) async {
    totalCart = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try {
      var url = Uri.parse("https://student.valuxapps.com/api/carts/$cartId");
      var response = await http.put(url, headers: {
        "lang": "ar",
        "Authorization": token,
      }, body: {
        "quantity": quantity,
      });
      totalCart = jsonDecode(response.body)["data"]["total"];
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

  List counter = [];
  count(int length) {
    for (int i = 0; i < length; i++) {
      counter.add(1);
    }
  }

  changequant(int index, int choice) async {
    if (choice == 1) {
      if (counter[index] > 0) {
        counter[index]--;
        quantity = counter[index].toString();
      } else {
        Get.snackbar("item",
            "Can not less than zero",
            barBlur: 20
        );
      }
    } else {
      counter[index]++;
      quantity = counter[index].toString();
    }
    update();
  }
}