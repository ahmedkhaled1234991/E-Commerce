import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class verifyEmailApi extends GetxController {

  String? email;

  verifyEmailApi(){
    verifyEmail().then((value) => update);
  }

  sendData(String email){
    this.email = email;
  }

  Future<String> verifyEmail() async {
    var url = Uri.parse("https://student.valuxapps.com/api/verify-email");
    var response = await http.post(url, headers: {
      "lang": "ar",
    }, body: {
      "email": email,
    });
    var responsebody = jsonDecode(response.body)["message"];
    print("message===>${responsebody}");
    return responsebody;
  }
}
