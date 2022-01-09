import 'package:ecommerce_app_project/Model/category_details_model.dart';
import 'package:ecommerce_app_project/Model/products_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CategoryDetailsApi extends GetxController{

  int productId;

  List<CategoryDetailsModel> listDataModel= [];

  CategoryDetailsApi(this.productId){
    categoryDetails().then((value)=>update);
  }

  Future categoryDetails() async{
    listDataModel= [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/categories/$productId");
      var response = await http.get(url,
          headers: {
            "lang":"ar",
            "Authorization":token,
          });
      var responsebody = jsonDecode(response.body)["data"]["data"];
      print("message===>${responsebody}");
      for(int i=0;i<responsebody.length;i++){
        listDataModel.add(CategoryDetailsModel.fromMap(responsebody[i]));
      }
    }catch(e){
      print("Error===>$e");
    }
  }
}