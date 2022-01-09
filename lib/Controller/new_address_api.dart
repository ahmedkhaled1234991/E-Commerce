import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class NewAddressApi extends GetxController{

  String? name;
  String? city;
  String? region;
  String? details;
  String latitude = "29.315582";
  String longitude = "30.855434";
  String notes = "Address";

  NewAddressApi(){
    newAddress().then((value) => update());
  }

  getDataAddress( String name,  String city,  String region, String details){
    this.name = name;
    this.city = city;
    this.region = region;
    this.details = details;
  }

  Future newAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token") as String;
    try {
      var url = Uri.parse("https://student.valuxapps.com/api/addresses");
      var response = await http.post(url, headers: {
        "lang": "ar",
        "Authorization": token,
      }, body: {
        "name": name,
        "city": city,
        "region": region,
        "details": details,
        "latitude": latitude,
        "longitude": longitude,
        "notes": notes,
      });
      var responsebody = jsonDecode(response.body);
      print("message===>${responsebody}");
      String message = responsebody["message"];
      print("message===>${message}");
      return message;
    } catch (e) {
      print("Error===>$e");
    }
  }
}
