import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_project/Controller/category_details_api.dart';
import 'package:ecommerce_app_project/Controller/get_categories_api.dart';
import 'package:ecommerce_app_project/View/Widgets/bottom_navigation_bar.dart';
import 'package:ecommerce_app_project/View/Widgets/exit_alert_dialog.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_details_screen.dart';

class CategoriesScreen extends GetWidget {
  GetCategoriesApi controller = Get.put(GetCategoriesApi());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() => ExitAlertDialog().onBackPressed(context)),
      child: GetBuilder<GetCategoriesApi>(
        builder: (controller) => Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.backgroundColor,
            elevation: 0.0,
          ),
          body: Center(
                  child: (controller.listDataModel.length == 0)
                      ? CircularProgressIndicator(
                    backgroundColor: context.theme.backgroundColor,
                    color: primaryColor,
                  ):PageView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: controller.listDataModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.put(CategoryDetailsApi(controller.listDataModel[index].id));
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            return CategoryDetailsScreen();
                          }));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.screenHeight / 5.6, horizontal: SizeConfig.screenWidth / 20),
                          child: Card(
                            color: context.theme.cardColor,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Container(
                                      height: SizeConfig.screenHeight / 3.5,
                                      width: SizeConfig.screenWidth / 1.1,
                                      child: CachedNetworkImage(
                                        imageUrl: controller.listDataModel[index].image,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                SizedBox(
                                  height:
                                  SizeConfig.screenHeight / 33,
                                ),
                                Text(
                                  "${controller.listDataModel[index].name}",
                                  style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenHeight * 0.03),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          bottomNavigationBar: Get.put(Bottomnavigationbar()).build(context),
        ),
      ),
    );
  }
}
