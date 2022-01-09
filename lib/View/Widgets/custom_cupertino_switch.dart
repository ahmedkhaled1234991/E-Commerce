import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../theme_service.dart';

class CustomCupertinoSwitch extends GetxController {

  bool switchValue=Get.isDarkMode;
  bool switchLangValue = false;
  //Locale locale = Locale('en','EN');

  changeModeValue(bool value){
    switchValue = value;
    if (Get.isDarkMode) {
      ThemeService().switchTheme(true);
    } else {
      ThemeService().switchTheme(false);
    }
    update();
  }

  changeLangValue(bool value, BuildContext context){
    switchLangValue = value;

    if(EasyLocalization.of(context)!.locale == Locale('en','EN')){
      context.locale = Locale('ar','AR');
      //Locale newLocale = Locale('ar','AR');
      //MyApp.setLocale(context, newLocale);
    }else if(EasyLocalization.of(context)!.locale == Locale('ar','AR')){
      context.locale = Locale('en','EN');
      //Locale newLocale = Locale('en','EN');
      //MyApp.setLocale(context, newLocale);
    }
    update();
  }
}
