import 'package:ecommerce_app_project/Controller/reset_password_api.dart';
import 'package:ecommerce_app_project/Controller/verify_email_api.dart';
import 'package:ecommerce_app_project/View/Screens/reset_password_screen.dart';
import 'package:ecommerce_app_project/View/Widgets/alert_dialog_forget_password.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_button.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgetPasswordScreen extends GetWidget {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;

  final verifyEmailApi controller = Get.put(verifyEmailApi());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<verifyEmailApi>(
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "please add your email below and click on verify email button in order to get \na new password by email.",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: SizeConfig.screenWidth * 0.046,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight/30,
                    ),
                    CustomTextFormField(
                      text: 'Email',
                      fontFamily: "SF-Pro-Display-Regular",
                      fontSize: SizeConfig.screenWidth * 0.04,
                      hint: 'Email',
                      onSave: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (!(value.contains('@')) ||
                            !(value.contains('.com')) ||
                            value.isEmpty) {
                          return "Please Enter Email";
                        }else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight/45,
                    ),
                    CustomButton(
                      onPress: () async{
                        _formKey.currentState!.save();

                        if (_formKey.currentState!.validate()) {
                          controller.sendData(email!);
                          Get.put(resetPasswordApi()).sendDataEmail(email!);
                          String message = await controller.verifyEmail();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(message,textAlign: TextAlign.right,)));
                          alertDialogForgetPassword().showdialog(context);
                        }
                      },
                      text: 'Verify Email',
                      fontFamily: "SF-Pro-Display-Regular",
                      fontSize: SizeConfig.screenWidth * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
