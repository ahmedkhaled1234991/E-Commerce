import 'package:ecommerce_app_project/Controller/reset_password_api.dart';
import 'package:ecommerce_app_project/View/Screens/forget_password_screen.dart';
import 'package:ecommerce_app_project/View/Screens/login_screen.dart';
import 'package:ecommerce_app_project/View/Screens/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class alertDialogForgetPassword {
  TextEditingController code = TextEditingController();

  final resetPasswordApi controller = Get.put(resetPasswordApi());

  Future<void> showdialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Check your email for the verification code"),
              content: TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                ),
                controller: code,
              ),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () async {
                    if(code.text.length == 4){
                      controller.sendCode(code.text);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return resetPasswordScreen();
                          }));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("تم ادخال الكود",textAlign: TextAlign.right,)));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("برجاء ادخال الكود",textAlign: TextAlign.right,)));
                  }
                  },
                ),
              ]);
        });
  }
}
