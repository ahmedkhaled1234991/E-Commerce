import 'package:ecommerce_app_project/Model/get_carts_model.dart';
import 'package:ecommerce_app_project/View/Screens/cart_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class GetCartsApi extends GetxController{

  List<GetCartsModel> listData = [];
  List<GetCartsModel> listDataModel= [];
  List listDataModelId = [];

  @override
  void onInit() {
    super.onInit();
    GetCartsApi();
  }

  GetCartsApi(){
    getCarts().then((value) => update());
  }

  Future getCarts() async{
    listDataModel.clear();
    listData.clear();
    listDataModelId.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/carts");
      var response = await http.get(url,
          headers: {
            "lang":"ar",
            "Authorization":token,
          });
      var responsebody = jsonDecode(response.body)["data"]["cart_items"];
      for(int i=0;i<responsebody.length;i++){
        listDataModelId.add(responsebody[i]["id"]);
      }
      //await Future.delayed(const Duration(seconds: 2));
      print("message===>${responsebody}");
      for(int i=0;i<responsebody.length;i++){
        listDataModel.add(GetCartsModel.fromMap(responsebody[i]["product"]));
      }
      for(int i=0;i<responsebody.length;i++){
        listData.add(GetCartsModel.fromMap(responsebody[i]["product"]));
      }
      return listDataModel;
    }catch(e){
      print("Error===>$e");
      return listDataModel;
    }
  }
}