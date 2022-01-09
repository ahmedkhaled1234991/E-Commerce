import 'package:ecommerce_app_project/Controller/reset_password_api.dart';
import 'package:ecommerce_app_project/Controller/verify_email_api.dart';
import 'package:ecommerce_app_project/View/Screens/login_screen.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_button.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text_form_field_pass.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class resetPasswordScreen extends GetWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? password;

  final resetPasswordApi controller = Get.put(resetPasswordApi());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<resetPasswordApi>(
      builder: (controller) => Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          elevation: 0.0,
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
          padding: EdgeInsets.only(
            top: SizeConfig.screenHeight / 12,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                customTextFormFieldPass(
                  text: 'New Password',
                  fontFamily: "SF-Pro-Display-Regular",
                  fontSize: SizeConfig.screenWidth * 0.04,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter New Password";
                    } else {
                      if (value.length < 3) {
                        return "Must be more than 2 character";
                      } else {
                        return null;
                      }
                    }
                  },
                  onSaved: (value) {
                    password = value;
                  },
                  hintText: 'New Password',
                  obscureText: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                CustomButton(
                  onPress: () async {
                    _formKey.currentState!.save();

                    if (_formKey.currentState!.validate()) {
                      controller.sendDataPass(password!);
                      String message = await controller.resetPassword();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(message, textAlign: TextAlign.right,)));
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return LoginScreen();
                      }));
                    }
                  },
                  text: 'Reset Password',
                  fontFamily: "SF-Pro-Display-Regular",
                  fontSize: SizeConfig.screenWidth * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
