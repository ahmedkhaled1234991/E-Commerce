import 'package:ecommerce_app_project/View/Widgets/bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'auth.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Auth());
    //Get.lazyPut(() => Bottomnavigationbar());
  }

}