import 'package:ecommerce_app_project/Model/upload_image.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RegisterApi extends GetxController{

  String? name;
  String? email;
  String? pass;
  String? phone;
  String image=UploadImage().image;


  sendDate(String name, String email, String phone, String pass){
    this.name = name;
    this.email = email;
    this.phone = phone;
    this.pass = pass;
  }

  Future<String> register() async {
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/register");
      var response = await http.post(url,
          headers: {
            "lang":"ar",
          },
          body: {
            "name":name,
            "email": email,
            "phone":phone,
            "password": pass,
            "image":image
          });
      var responsebody = jsonDecode(response.body)["message"];
      print("message===>${responsebody}");
      return responsebody;
    }catch (e){
      Get.snackbar("Internet", "Internet connection is bad");
      return "";
    }
    }
}