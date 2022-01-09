import 'package:ecommerce_app_project/Model/social_contacts_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactsApi extends GetxController {

  List<SocialContactsModel> listDataModel = [];
  String email = '';
  String phone = '';

  ContactsApi(){
    contacts().then((value) => update());
  }

  Future contacts() async{
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/contacts");
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body)["data"]["data"];
      print("=========>${responsebody}");
      for(int i=0;i<responsebody.length;i++){
        if(responsebody[i]["type"] == 1){
          phone = responsebody[i]["value"];
        }else if(responsebody[i]["type"] == 2){
          email = responsebody[i]["value"];
        }else{
          listDataModel.add(SocialContactsModel.fromMap(responsebody[i]));
        }
      }
    }catch(e){
      print("Error===>$e");
    }
  }
}