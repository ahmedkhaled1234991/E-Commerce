import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app_project/theme.dart';
import 'package:ecommerce_app_project/theme_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controller/binding.dart';
import 'View/Screens/cart_screen.dart';
import 'View/Screens/catergories_screen.dart';
import 'View/Screens/home_screen.dart';
import 'View/Screens/login_screen.dart';
import 'View/Screens/settings_screen.dart';
import 'View/Widgets/bottom_navigation_bar.dart';
import 'View/Widgets/custom_cupertino_switch.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(DevicePreview(
      enabled: false,
      builder: (context) => EasyLocalization(
        child: MyApp(),
        path: "resources/langs",
        supportedLocales: [
            Locale('en','EN'),
            Locale('ar','AR'),
          ],
        saveLocale: true,
      )
  ),
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var check;

  checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      check = prefs.getString("token");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //translations: ,
      //useInheritedMediaQuery: true,
      //locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder,
      navigatorKey: NavigationService.instance.navigationkey,
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        'HomeScreen': (context) => HomeScreen(),
        'CartScreen': (context) => CartScreen(false),
        'SettingsScreen': (context) => SettingsScreen(),
        'CategoriesScreen': (context) => CategoriesScreen(),
      },
      initialBinding: Binding(),
      /*theme: ThemeData(
          primarySwatch: Colors.blue,
        ),*/
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: AnimatedSplashScreen(
        duration: 5000,
        splash: Image.asset("assets/images/Ecommerce.png", fit: BoxFit.cover),
        nextScreen: (check == null) ? LoginScreen() : HomeScreen(),
        backgroundColor: Colors.black,
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}


