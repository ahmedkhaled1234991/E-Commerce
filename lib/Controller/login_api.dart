import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginApi extends GetxController{

  String? email;
  String? pass;

  LoginApi(){
    login().then((value) => update());
  }

  sendData(String email, String pass){
    this.email = email;
    this.pass = pass;
  }

  Future login() async {
    var url = Uri.parse("https://student.valuxapps.com/api/login");
    var response = await http.post(url,
        headers: {
          "lang":"ar",
        },
        body: {
          "email": email,
          "password": pass,
        });
    var responsebody = jsonDecode(response.body);
    print("message===>${responsebody}");
    bool status = responsebody["status"];
    int id = responsebody["data"]["id"];
    String token = responsebody["data"]["token"];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("status", status);
    prefs.setInt("userid", id);
    prefs.setString("token", token);
    return responsebody;
  }

  Future<bool> getStatus() async{
    var result = await login();
    bool status = result["status"];
    result = '';
    return status;
  }

  Future<String> getMessage() async{
    var result = await login();
    String message = result["message"];
    return message;
  }
}