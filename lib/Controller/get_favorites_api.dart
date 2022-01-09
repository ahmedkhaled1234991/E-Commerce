import 'package:ecommerce_app_project/Model/get_favorites_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class GetFavoritesApi extends GetxController{

  List<GetFavoritesModel> listDataModel = [];

  GetFavoritesApi() {
    getFavorites().then((value)=>update());
  }

  getFavorites() async{
    listDataModel.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/favorites");
      var response = await http.get(url,
          headers: {
            "lang":"ar",
            "Authorization": token,
          });
      var responsebody = jsonDecode(response.body)["data"]["data"];
      print("message===>${responsebody}");
      for(int i=0;i<responsebody.length;i++){
        listDataModel.add(GetFavoritesModel.fromMap(responsebody[i]["product"]));
      }
      return listDataModel;
    }catch(e){
      print("Error===>$e");
      return listDataModel;
    }
  }
}