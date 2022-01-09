import 'package:ecommerce_app_project/Controller/new_address_api.dart';
import 'package:ecommerce_app_project/Model/address_model.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_button.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends GetWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? country;
  String? name, region, city, details;
  List address = [];

  NewAddressApi newAddress = Get.put(NewAddressApi());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                        CustomText(
                          text: "Address",
                          fontSize: SizeConfig.screenWidth * 0.06,
                          fontFamily: "SF-Pro-Display-Bold",
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight / 15,
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
                            } else {
                              if (value.length < 3) {
                                return "Must be more than 2 character";
                              } else {
                                return null;
                              }
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight / 32.5,
                        ),
                        CustomTextFormField(
                          text: 'City',
                          fontFamily: "SF-Pro-Display-Regular",
                          fontSize: SizeConfig.screenWidth * 0.04,
                          hint: 'City',
                          onSave: (value) {
                            city = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please Enter City";
                            } else {
                              if (value.length < 3) {
                                return "Must be more than 2 character";
                              } else {
                                return null;
                              }
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight / 32.5,
                        ),
                        CustomTextFormField(
                          text: 'Region',
                          fontFamily: "SF-Pro-Display-Regular",
                          fontSize: SizeConfig.screenWidth * 0.04,
                          hint: 'Region',
                          onSave: (value) {
                            region = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please Enter Region";
                            } else {
                              if (value.length < 3) {
                                return "Must be more than 2 character";
                              } else {
                                return null;
                              }
                            }
                          },
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight / 32.5,
                        ),
                        Container(
                          //width: MediaQuery.of(context).size.width / 2.7,
                          child: Column(
                            children: [
                              /*Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8),
                                child: CustomText(
                                  text: 'Details',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "SF-Pro-Display-Regular",
                                ),
                              ),*/
                              CustomTextFormField(
                                text: 'Details',
                                fontFamily: "SF-Pro-Display-Regular",
                                fontSize: SizeConfig.screenWidth * 0.04,
                                hint: 'Details',
                                onSave: (value) {
                                  details = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Details";
                                  } else {
                                    if (value.length < 3) {
                                      return "Must be more than 2 character";
                                    } else {
                                      return null;
                                    }
                                  }
                                },
                                keyboardType: TextInputType.name,
                              ),
                            ],
                          ),
                        ),
                        /*Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CustomText(
                                text: 'Country',
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: "SF-Pro-Display-Regular",
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.7,
                              child: DropdownButtonFormField(
                                value: country,
                                items: <DropdownMenuItem<int>>[
                                  DropdownMenuItem(
                                    child: Text('Egypt'),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('USA'),
                                    value: 1,
                                  ),
                                ],
                                onChanged: (value) {
                                  country = value as int?;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[300],
                                  hintText: 'Country',
                                  hintStyle: const TextStyle(
                                    color: Color(0xffB1B1B1),
                                  ),
                                  contentPadding: const EdgeInsets.all(20),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                          ],
                        ),*/
                        SizedBox(
                          height: SizeConfig.screenHeight / 20,
                        ),
                        CustomButton(
                          onPress: () async {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          newAddress.getDataAddress(name!, city!, region!, details!);
                          String message = await newAddress.newAddress();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(message, textAlign: TextAlign.right,)));
                        }
                          },
                          text: 'Add Address',
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
    );
  }
}
