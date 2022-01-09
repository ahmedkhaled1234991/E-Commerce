import 'package:ecommerce_app_project/Controller/register_api.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_button.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text_form_field_pass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class RegisterScreen extends GetWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name, email, phone, password;


  final RegisterApi controller = Get.put(RegisterApi());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<RegisterApi>(
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
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CustomText(
                            text: "Sign Up,",
                            fontSize: SizeConfig.screenWidth * 0.06,
                            fontFamily: "SF-Pro-Display-Bold",
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight/15,
                          ),
                          CustomTextFormField(
                            text: 'Name',
                            fontFamily: "SF-Pro-Display-Regular",
                            fontSize: SizeConfig.screenWidth * 0.04,
                            hint: 'Name',
                            onSave: (value) {
                              name = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Enter Name";
                              }else{
                                if (value.length < 3) {
                                return "Must be more than 2 character";
                              }else{
                                  return null;
                                }
                              }
                            },
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight/32.5,
                          ),
                          CustomTextFormField(
                            text: 'Phone',
                            fontFamily: "SF-Pro-Display-Regular",
                            fontSize: SizeConfig.screenWidth * 0.04,
                            hint: 'Phone',
                            onSave: (value) {
                              phone = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Enter Phone";
                              }else{
                                if (value.length < 3) {
                                  return "Must be more than 2 character";
                                }else{
                                  return null;
                                }
                              }
                            },
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight/32.5,
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
                            height: SizeConfig.screenHeight/32.5,
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
                            height: SizeConfig.screenHeight/10,
                          ),
                          CustomButton(
                            onPress: () async{
                              _formKey.currentState!.save();

                              if (_formKey.currentState!.validate()) {
                                controller.sendDate(name!, email!, phone!, password!);
                                String message = await controller.register();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(message,textAlign: TextAlign.right,)));
                              }
                            },
                            text: 'SIGN Up',
                            fontSize: SizeConfig.screenWidth * 0.05,
                            fontFamily: "SF-Pro-Display-Regular",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
