import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BannersApi extends GetxController{

  List listDataModel= [];

  BannersApi(){
    banners().then((value) => update());
  }

  Future banners() async{
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/banners");
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body)["data"];
      print("=========>${responsebody}");
      for(int i=0;i<responsebody.length;i++){
        if(responsebody[i]["image"].contains(' ')){
          responsebody[i]["image"].replaceAll(' ', '%20');
          listDataModel.add(responsebody[i]["image"]);
        }else{
          listDataModel.add(responsebody[i]["image"]);
        }
      }
    }catch(e){
      print("Error===>$e");
    }
  }
}