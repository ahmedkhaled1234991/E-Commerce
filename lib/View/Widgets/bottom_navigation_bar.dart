import 'package:ecommerce_app_project/View/Screens/cart_screen.dart';
import 'package:ecommerce_app_project/View/Screens/home_screen.dart';
import 'package:ecommerce_app_project/View/Screens/settings_screen.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Bottomnavigationbar extends GetxController {

  int _navigatorValue = 0;


  @override
  Widget build(BuildContext context, [navigator]) {
    SizeConfig().init(context);
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                "Explore",
                style: TextStyle(fontSize: SizeConfig.screenWidth * 0.045, color: Color(0xffB05E27)),
              ),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child:
              SvgPicture.asset('assets/icons/Icon_Explore.svg', width: 25),
            )),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: SizeConfig.screenWidth * 0.045, color: Color(0xffB05E27)),
              ),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child:
              SvgPicture.asset('assets/icons/Icon_Categories.svg', width: 25),
            )),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                "Cart",
                style: TextStyle(fontSize: SizeConfig.screenWidth * 0.045, color: Color(0xffB05E27)),
              ),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SvgPicture.asset('assets/icons/Icon_Cart.svg', width: 25),
            )),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                "Account",
                style: TextStyle(fontSize: SizeConfig.screenWidth * 0.045, color: Color(0xffB05E27)),
              ),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SvgPicture.asset('assets/icons/Icon_User.svg', width: 25),
            )),
      ],
      currentIndex: _navigatorValue,
      onTap: (index) {
        changeSelectedValue(index);
      },
      elevation: 0,
      //selectedItemColor: context.theme.bottomNavigationBarTheme.selectedItemColor,
      backgroundColor: Colors.grey.shade50,
    );
  }

  void changeSelectedValue(int selectedValue) {
    Get.delete();
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          NavigationService.instance.navigationkey!.currentState!
              .pushNamed("HomeScreen");
          break;
        }
      case 1:
        {
          NavigationService.instance.navigationkey!.currentState!
              .pushNamed("CategoriesScreen");
          break;
        }
      case 2:
        {
          NavigationService.instance.navigationkey!.currentState!
              .pushNamed("CartScreen");
          break;
        }
      case 3:
        {
          NavigationService.instance.navigationkey!.currentState!
              .pushNamed("SettingsScreen");
          Get.to(SettingsScreen());
          break;
        }
    }
    update();
  }

  //to change navigationbottombar for cart screen
  Widget fromProduct(bool check, BuildContext context){
    if(check == true){
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Explore",
                  style: TextStyle(fontSize: SizeConfig.screenWidth * 0.045, color: Color(0xffB05E27)),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child:
                SvgPicture.asset('assets/icons/Icon_Explore.svg', width: 28),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: SizeConfig.screenWidth * 0.045, color: Color(0xffB05E27)),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child:
                SvgPicture.asset('assets/icons/Icon_Categories.svg', width: 25),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Cart",
                  style: TextStyle(fontSize: SizeConfig.screenWidth * 0.045, color: Color(0xffB05E27)),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset('assets/icons/Icon_Cart.svg', width: 28),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Account",
                  style: TextStyle(fontSize: SizeConfig.screenWidth * 0.045, color: Color(0xffB05E27)),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset('assets/icons/Icon_User.svg', width: 28),
              )),
        ],
        currentIndex: 2,
        onTap: (index) {
          changeSelectedValue(index);
        },
        elevation: 0,
        //selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      );
    }else{
      return Get.put(Bottomnavigationbar()).build(context);
    }
  }
}

class NavigationService{
  GlobalKey<NavigatorState>? navigationkey;

  static NavigationService instance = NavigationService();

  NavigationService(){
    navigationkey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String _rn){
    return navigationkey!.currentState!.pushReplacementNamed(_rn);
  }

  Future<dynamic> navigateTo(String _rn){
    return navigationkey!.currentState!.pushNamed(_rn);
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute _rn){
    return navigationkey!.currentState!.push(_rn);
  }

  goback(){
    return navigationkey!.currentState!.pop();

  }
}
