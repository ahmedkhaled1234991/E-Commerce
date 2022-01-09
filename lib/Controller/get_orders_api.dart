import 'package:ecommerce_app_project/Model/get_orders_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class GetOrdersApi extends GetxController{

  List<GetOrdersModel> listDataModel = [];

  GetOrdersApi(){
    getOrders().then((value) => update());
  }

  Future getOrders() async{
    listDataModel.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/orders");
      var response = await http.get(url,
          headers: {
            "lang":"ar",
            "Authorization":token,
          });
      var responsebody = jsonDecode(response.body)["data"]["data"];
      for(int i=0;i<responsebody.length;i++){
        listDataModel.add(GetOrdersModel.fromMap(responsebody[i]));
      }
    }catch(e){
      print("Error===>$e");
    }
  }
}