import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class resetPasswordApi extends GetxController{

  String? email;
  String? code;
  String? password;

  resetPasswordApi(){
    resetPassword().then((value) => update());
  }

  sendCode(String code){
    this.code = code;
  }

  sendDataEmail(String email){
    this.email = email;
  }

  sendDataPass(String password){
    this.password = password;
  }

  Future<String> resetPassword() async {
    var url = Uri.parse("https://student.valuxapps.com/api/reset-password");
    var response = await http.post(url,
        headers: {
          "lang":"ar",
        },
        body: {
          "email": email,
          "code": code,
          "password": password
        });
    var responsebody = jsonDecode(response.body)["message"];
    print("message===>${responsebody}");
    return responsebody;
  }

}