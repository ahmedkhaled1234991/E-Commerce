import 'package:ecommerce_app_project/Model/products_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductDetailsApi extends GetxController{

  int productId = 0;
  String name = '';
  int price = 0;
  int old_price = 0;
  int discount = 0;
  String description = '';
  String image = '';
  List images = [];

  SendproductId(int id) async{
    this.productId = id;
    await productDetails().then((value) => update());
  }

  productDetails() async{
    name = '';
    price = 0;
    old_price = 0;
    discount = 0;
    description = '';
    image = '';
    images = [];
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/products/$productId");
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body)["data"];
      print("=========>${responsebody}");
      name = responsebody["name"];
      price = responsebody["price"];
      old_price = responsebody["old_price"];
      discount = responsebody["discount"];
      description = responsebody["description"];
      image = responsebody["image"];
      images = responsebody ["images"];
    }catch(e){
      print("Error===>$e");
    }
  }
}