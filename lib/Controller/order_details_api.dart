import 'package:ecommerce_app_project/Controller/get_orders_api.dart';
import 'package:ecommerce_app_project/Model/order_details_model.dart';
import 'package:ecommerce_app_project/Model/products_order_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailsApi extends GetxController{

  int orderId = 0;
  List<OrderDetailsModel> listDataModel = [];
  List<ProductsOrderModel> listDataModelProducts = [];
  List idList = [];

  GetOrdersApi getOrders = Get.put(GetOrdersApi());

  OrderDetailsApi(){
    getIdList();
    orderDetails().then((value) => update());
  }


  getIdList(){
    for(int i=0;i<getOrders.listDataModel.length;i++){
      if(getOrders.listDataModel[i].status == "جديد"){
        idList.add(getOrders.listDataModel[i].id);
      }
    }
  }

  Future orderDetails() async{
    listDataModel.clear();
    listDataModelProducts.clear();
    //idList.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try{
      for(int i=0;i<idList.length;i++){
        var url = Uri.parse("https://student.valuxapps.com/api/orders/${idList[i]}");
        var response = await http.get(url,
            headers: {
              "lang":"ar",
              "Authorization":token,
            });
        var responsebody = jsonDecode(response.body)["data"];
        for(int i=0;i<responsebody.length;i++){
          listDataModel.add(OrderDetailsModel.fromMap(responsebody[i]));
        }
        var products = responsebody["products"];
        for(int i=0;i<products.length;i++){
          listDataModelProducts.add(ProductsOrderModel.fromMap(products[i]));
        }
        print("responsebody================${products}");
      }
      idList.clear();
      return listDataModelProducts;
    }catch(e){
      print("Error===>$e");
      return listDataModelProducts;
    }
  }
}