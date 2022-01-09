import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileApi extends GetxController{

  String image = '';
  String name = '';
  String email = '';

  ProfileApi(){
    profile().then((value) => update());
  }

  Future profile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/profile");
      var response = await http.get(url,
          headers: {
            "lang":"ar",
            "Authorization":token,
          });
      var responsebody = jsonDecode(response.body)["data"];
      image = responsebody["image"];
      name = responsebody["name"];
      email = responsebody["email"];
    }catch(e){
      print("Error===>$e");
    }
  }
}