import 'package:ecommerce_app_project/Model/products_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsApi extends GetxController{

  List<ProductsModel> listDataModel= [];

  ProductsApi(){
    products().then((value) => update());
  }

  Future products() async{
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/products");
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body)["data"]["data"];
      for(int i=0;i<responsebody.length;i++){
        listDataModel.add(ProductsModel.fromMap(responsebody[i]));
      }
    }catch(e){
      print("Error===>$e");
    }
  }

}