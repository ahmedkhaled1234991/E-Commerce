import 'package:ecommerce_app_project/Controller/faqs_api.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQsScreen extends GetWidget {

  FAQsApi controller = Get.put(FAQsApi());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FAQsApi>(
      builder: (controller) => Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primaryColor,
          title: Text(
              "FAQs",
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
          child: ListView.builder(
            itemCount: controller.listDataModelquestionQuestion.length,
            itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ExpansionTile(
                backgroundColor: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      controller.listDataModelquestionQuestion[index],
                    style: context.theme.textTheme.headline3!.copyWith(fontSize: 22),
                ),
                  ),
                children: <Widget>[
                ListTile(
                title:Align(
                  alignment: Alignment.centerRight,
                    child: Text("${controller.listDataModelquestionAnswer[index]}", style: context.theme.textTheme.headline3!.copyWith(fontSize: 18),textAlign: TextAlign.right,)),
                ),
                ],
              ),
            );
          },),
        ),
      ),
    );
  }
}
