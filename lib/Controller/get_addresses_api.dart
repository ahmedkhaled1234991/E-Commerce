import 'package:ecommerce_app_project/Model/address_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class GetAddressesApi extends GetxController{

  List<AddressModel> listDataModel= [];

  GetAddressesApi(){
    getAddresses().then((value) => update());
  }

  Future getAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try {
      var url = Uri.parse("https://student.valuxapps.com/api/addresses");
      var response = await http.get(url,
          headers: {
            "lang": "ar",
            "Authorization": token,
          });
      var responsebody = jsonDecode(response.body)["data"]["data"];
      print("message===>${responsebody}");
      for (int i = 0; i < responsebody.length; i++) {
        listDataModel.add(AddressModel.fromMap(responsebody[i]));
      }
    } catch (e) {
      print("Error===>$e");
    }
  }
}
