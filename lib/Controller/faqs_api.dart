import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FAQsApi extends GetxController{

  List listDataModelquestionQuestion= [];
  List listDataModelquestionAnswer= [];

  FAQsApi(){
    faqs().then((value) => update());
  }

  Future faqs() async{
    try{
      var url = Uri.parse("https://student.valuxapps.com/api/faqs");
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body)["data"]["data"];
      print("=========>${responsebody}");
      for(int i=0;i<responsebody.length;i++){
        listDataModelquestionQuestion.add(responsebody[i]["question"]);
      }
      for(int i=0;i<responsebody.length;i++){
        listDataModelquestionAnswer.add(responsebody[i]["answer"]);
      }
    }catch(e){
      print("Error===>$e");
    }
  }
}