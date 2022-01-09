import 'package:ecommerce_app_project/Model/get_categories_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetCategoriesApi extends GetxController{

  List<GetCategoriesModel> listDataModel= [];


  GetCategoriesApi(){
    getCategories().then((value)=>update);
  }

   Future getCategories() async{
    listDataModel.clear();
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/categories");
      var response = await http.get(url,
          headers: {
            "lang":"ar",
          });
      var responsebody = jsonDecode(response.body)["data"]["data"];
      print("message===>${responsebody}");
      for(int i=0;i<responsebody.length;i++){
        listDataModel.add(GetCategoriesModel.fromMap(responsebody[i]));
      }
    }catch(e){
      print("Error===>$e");
    }
  }
}