import 'package:ecommerce_app_project/Controller/add_order_api.dart';
import 'package:ecommerce_app_project/Controller/get_addresses_api.dart';
import 'package:ecommerce_app_project/Controller/get_orders_api.dart';
import 'package:ecommerce_app_project/Controller/order_details_api.dart';
import 'package:ecommerce_app_project/Controller/profile_api.dart';
import 'package:ecommerce_app_project/View/Screens/favorite_screen.dart';
import 'package:ecommerce_app_project/View/Screens/login_screen.dart';
import 'package:ecommerce_app_project/View/Widgets/bottom_navigation_bar.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_cupertino_switch.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_text.dart';
import 'package:ecommerce_app_project/View/Widgets/exit_alert_dialog.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:ecommerce_app_project/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'address_screen.dart';
import 'contacts_screen.dart';
import 'faqs_screen.dart';
//import 'orders_screen.dart';

class SettingsScreen extends GetWidget {
  ProfileApi controller = Get.put(ProfileApi());

  CustomCupertinoSwitch customCupertinoSwitch = Get.put(CustomCupertinoSwitch());
  OrderDetailsApi orderDetails = Get.put(OrderDetailsApi());
  GetOrdersApi getOrders = Get.put(GetOrdersApi());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: (() => ExitAlertDialog().onBackPressed(context)),
      child: GetBuilder<ProfileApi>(
        builder: (controller) => Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.backgroundColor,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        //backgroundImage: NetworkImage(controller.image),
                        backgroundImage:
                            AssetImage("assets/images/Ahmed khaled.jpg"),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth / 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.name}",
                            style: context.theme.textTheme.headline1,
                          ),
                          Text(
                            "${controller.email}",
                            style: context.theme.textTheme.bodyText1!.copyWith(fontSize: SizeConfig.screenWidth * 0.033),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight / 28,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dark Mode",
                          style: context.theme.textTheme.headline6!.copyWith(fontSize: SizeConfig.screenWidth * 0.048),),
                        //SizedBox(width: MediaQuery.of(context).size.width / 1.8,),
                        GetBuilder<CustomCupertinoSwitch>(
                          builder: (controller) => CupertinoSwitch(
                            activeColor: primaryColor,
                            value: customCupertinoSwitch.switchValue,
                            onChanged: (value) {
                              customCupertinoSwitch.changeModeValue(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight / 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Arabic Language",
                          style: context.theme.textTheme.headline6!.copyWith(fontSize: SizeConfig.screenWidth * 0.048),),
                        //SizedBox(width: MediaQuery.of(context).size.width / 1.8,),
                        GetBuilder<CustomCupertinoSwitch>(
                          builder: (controller) => CupertinoSwitch(
                            activeColor: primaryColor,
                            value: customCupertinoSwitch.switchLangValue,
                            onChanged: (value) {
                              customCupertinoSwitch.changeLangValue(value, context);
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight / 45,
                  ),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return Favoritescreen();
                        }));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: primaryColor,
                            size: 28,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth / 55,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CustomText(
                              text: "Favorites",
                              fontSize: SizeConfig.screenWidth * 0.048,
                              fontFamily: 'SF-Pro-Display-Regular',
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: context.theme.iconTheme.color,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight / 30,
                  ),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return AddressScreen();
                        }));
                      },
                      child: Row(
                        children: [
                        SvgPicture.asset("assets/icons/Icon_Location.svg", width: 26,),
                          SizedBox(
                            width: SizeConfig.screenWidth / 55,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CustomText(
                              text: "Shipping Address",
                              fontSize: SizeConfig.screenWidth * 0.048,
                              fontFamily: 'SF-Pro-Display-Regular',
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: context.theme.iconTheme.color,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight / 30,
                  ),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        /*Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return OrdersScreen();
                        }));*/
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/Icon_History.svg", width: 26,),
                          SizedBox(
                            width: SizeConfig.screenWidth / 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CustomText(
                              text: "Order History",
                              fontSize: SizeConfig.screenWidth * 0.048,
                              fontFamily: 'SF-Pro-Display-Regular',
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: context.theme.iconTheme.color,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight / 30,
                  ),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return FAQsScreen();
                        }));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.help,
                            color: primaryColor,
                            size: 28,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth / 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CustomText(
                              text: "FAQs",
                              fontSize: SizeConfig.screenWidth * 0.048,
                              fontFamily: 'SF-Pro-Display-Regular',
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: context.theme.iconTheme.color,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return ContactsScreen();
                        }));
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/Icon_Contacts.svg", width: 26,),
                          SizedBox(
                            width: SizeConfig.screenWidth / 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CustomText(
                              text: "Contacts",
                              fontSize: SizeConfig.screenWidth * 0.048,
                              fontFamily: 'SF-Pro-Display-Regular',
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: context.theme.iconTheme.color,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight / 30,
                  ),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.remove("token");
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) {
                          return LoginScreen();
                        }), (route) => false);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('تم تسجيل الخروج', textAlign: TextAlign.right,)));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            color: primaryColor,
                            size: 28,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth / 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CustomText(
                              text: "Logout",
                              fontSize: SizeConfig.screenWidth * 0.048,
                              fontFamily: 'SF-Pro-Display-Regular',
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: context.theme.iconTheme.color,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Get.put(Bottomnavigationbar()).build(context),
        ),
      ),
    );
  }
}
