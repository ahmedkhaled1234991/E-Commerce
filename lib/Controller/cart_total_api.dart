import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartTotalApi extends GetxController{

  int total = 0;

  Future getCartsTotal() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/carts");
      var response = await http.get(url,
          headers: {
            "lang":"ar",
            "Authorization":token,
          });
      //await Future.delayed(const Duration(seconds: 2));
      int totalCart = jsonDecode(response.body)["data"]["total"];
      print("totalCart===>${totalCart}");
      return totalCart;
    }catch(e){
      print("Error===>$e");
    }
    update();
  }

  gettotal() async{
    await getCartsTotal().then((value){
      total = value;
    });
    update();
  }
}