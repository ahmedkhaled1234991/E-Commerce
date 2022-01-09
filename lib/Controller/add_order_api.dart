import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AddOrderApi extends GetxController{

  //int orderId = 0;
  String address_id ="0";
  String payment_method = "1";
  String get use_points => "false";
  String promo_code_id = "";//19

  String message = "";

  AddOrderApi(){
    addOrder().then((value) => update());
  }

    getDataOrder(int address_id, int payment_method){
      this.address_id = address_id.toString();
      this.payment_method = payment_method.toString();
    }

    Future addOrder() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.get("token") as String;
      try {
        var url = Uri.parse("https://student.valuxapps.com/api/orders");
        var response = await http.post(url, headers: {
          "lang": "ar",
          "Authorization": token,
        }, body: {
          "address_id": address_id,
          "payment_method": payment_method,
          "use_points": use_points,
          "promo_code_id": promo_code_id
        });
        var responsebody = jsonDecode(response.body);
        //orderId = responsebody["id"];
        //print("orderId===>${orderId}");
        message = responsebody["message"];
        print("message===>${message}");
        //return message;
      } catch (e) {
        print("Error===>$e");
      }
    }
  }
