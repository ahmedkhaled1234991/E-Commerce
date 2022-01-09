import 'package:ecommerce_app_project/Controller/contacts_api.dart';
import 'package:ecommerce_app_project/View/Screens/social_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ContactsScreen extends GetWidget {
  ContactsApi controller = Get.put(ContactsApi());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactsApi>(
      builder: (controller) => Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primaryColor,
          title: Text(
            "Contacts",
            style: context.theme.textTheme.headline2!.copyWith(fontSize: 24),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: context.theme.iconTheme.color,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 12,
                child: Card(
                  color: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, size: 22,),
                      SizedBox(width: MediaQuery.of(context).size.width / 30,),
                      Text(
                        "${controller.phone}",
                        style: context.theme.textTheme.headline2!.copyWith(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 12,
                child: Card(
                  color: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined, size: 22,),
                      SizedBox(width: MediaQuery.of(context).size.width / 30,),
                      Text(
                        "${controller.email}",
                        style: context.theme.textTheme.headline2!.copyWith(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: controller.listDataModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return socialContacts(controller.listDataModel[index].id,controller.listDataModel[index].value,context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialContacts(id,link, BuildContext context){
    if(id == 1){
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return WebViewScreen("Facebook",link);
          }));
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          child: Card(
            color: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/Icon_Facebook.svg"),
                  SizedBox(width: MediaQuery.of(context).size.width / 30,),
                  Text(
                    "Facebook",
                    style: context.theme.textTheme.headline2!.copyWith(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }else if(id == 2){
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return WebViewScreen("Instagram",link);
          }));
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          child: Card(
            color: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/Icon_Instagram.svg", width: 22,),
                  SizedBox(width: MediaQuery.of(context).size.width / 30,),
                  Text(
                    "Instagram",
                    style: context.theme.textTheme.headline2!.copyWith(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }else if(id == 3){
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return WebViewScreen("Twitter",link);
          }));
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          child: Card(
            color: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/Icon_Twitter.svg", width: 22,),
                  SizedBox(width: MediaQuery.of(context).size.width / 30,),
                  Text(
                    "Twitter",
                    style: context.theme.textTheme.headline2!.copyWith(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }else if(id == 6){
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return WebViewScreen("Whatsapp",link);
          }));
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          child: Card(
            color: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/Icon_Whatsapp.svg", width: 22,),
                  SizedBox(width: MediaQuery.of(context).size.width / 30,),
                  Text(
                    "Whatsapp",
                    style: context.theme.textTheme.headline2!.copyWith(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }else if(id == 7){
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return WebViewScreen("Snapchat",link);
          }));
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          child: Card(
            color: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/Icon_Snapchat.svg", width: 22,),
                  SizedBox(width: MediaQuery.of(context).size.width / 30,),
                  Text(
                    "Snapchat",
                    style: context.theme.textTheme.headline2!.copyWith(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }else if(id == 8){
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return WebViewScreen("Youtube",link);
          }));
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          child: Card(
            color: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/Icon_Youtube.svg", width: 22,),
                  SizedBox(width: MediaQuery.of(context).size.width / 30,),
                  Text(
                    "Youtube",
                    style: context.theme.textTheme.headline2!.copyWith(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }else if(id == 9){
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return WebViewScreen("Website",link);
          }));
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          child: Card(
            color: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/Icon_Website.svg"),
                  SizedBox(width: MediaQuery.of(context).size.width / 30,),
                  Text(
                    "Website",
                    style: context.theme.textTheme.headline2!.copyWith(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }else{
      return SizedBox(height: 0,);
    }
  }
}
