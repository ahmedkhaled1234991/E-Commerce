import 'package:ecommerce_app_project/Controller/auth.dart';
import 'package:ecommerce_app_project/Controller/login_api.dart';
import 'package:ecommerce_app_project/Controller/reset_password_api.dart';
import 'package:ecommerce_app_project/View/Screens/register_screen.dart';
import 'package:ecommerce_app_project/View/Widgets/alert_dialog_forget_password.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_button.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_button_social_login.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text_form_field_pass.dart';
import 'package:ecommerce_app_project/View/Widgets/exit_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'forget_password_screen.dart';
import 'home_screen.dart';

class LoginScreen extends GetWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email, password;

  final LoginApi controller = Get.put(LoginApi());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: (() => ExitAlertDialog().onBackPressed(context)),
      child: GetBuilder<LoginApi>(
        builder: (controller) => Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.backgroundColor,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      color: (Get.isDarkMode)?context.theme.cardColor:Colors.white,
                      elevation: 5,
                      shadowColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Welcome,",
                                  fontSize: SizeConfig.screenWidth * 0.06,
                                  fontFamily: "SF-Pro-Display-Bold",
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return RegisterScreen();
                                    }));
                                  },
                                  child: CustomText(
                                    text: "Sign Up",
                                    color: primaryColor,
                                    fontSize: SizeConfig.screenWidth * 0.04,
                                    fontFamily: "SF-Pro-Display-Regular",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight / 75,
                            ),
                            CustomText(
                              text: 'Sign in to Continue',
                              fontSize: SizeConfig.screenWidth * 0.035,
                              color: Colors.grey,
                              fontFamily: "SF-Pro-Display-Regular",
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight / 22.5,
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
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight / 32.5,
                            ),
                            customTextFormFieldPass(
                              text: 'Password',
                              fontFamily: "SF-Pro-Display-Regular",
                              fontSize: SizeConfig.screenWidth * 0.04,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter Password";
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
                              hintText: 'Password',
                              obscureText: true,
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight / 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return forgetPasswordScreen();
                                }));
                              },
                              child: CustomText(
                                text: 'Forgot Password?',
                                fontSize: SizeConfig.screenWidth * 0.035,
                                alignment: Alignment.topRight,
                                fontWeight: FontWeight.w400,
                                fontFamily: "SF-Pro-Display-Regular",
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight / 30,
                            ),
                            CustomButton(
                              onPress: () async {
                                _formKey.currentState!.save();

                                if (_formKey.currentState!.validate()) {
                                  controller.sendData(email!, password!);
                                  bool check = await controller.getStatus();
                                  String message = await controller.getMessage();
                                  if(check == true){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                                      return HomeScreen();
                                    }));
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(message, textAlign: TextAlign.right,)));
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(message, textAlign: TextAlign.right,)));
                                  }

                                }
                              },
                              text: 'SIGN IN',
                              fontFamily: "SF-Pro-Display-Regular",
                              fontSize: SizeConfig.screenWidth * 0.05,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight / 20,
                    ),
                    CustomText(
                      text: '-OR-',
                      alignment: Alignment.center,
                      fontFamily: "SF-Pro-Display-Regular",
                      fontSize: SizeConfig.screenWidth * 0.04,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight / 30,
                    ),
                    CustomButtonSocial(
                      text: 'Sign In with Facebook',
                      fontFamily: "SF-Pro-Display-Medium",
                      fontSize: SizeConfig.screenWidth * 0.05,
                      onPress: () {
                        Get.put(Auth()).facebookSignInMethod();
                      },
                      imageName: 'assets/icons/Icon_Facebook.svg',
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight / 44.5,
                    ),
                    CustomButtonSocial(
                      text: 'Sign In with Google',
                      fontFamily: "SF-Pro-Display-Medium",
                      fontSize: SizeConfig.screenWidth * 0.05,
                      onPress: () {
                        Get.put(Auth()).googleSignInMethod();
                      },
                      imageName: 'assets/icons/icons8_Google_2.svg',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
