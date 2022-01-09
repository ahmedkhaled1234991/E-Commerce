import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_project/Controller/add_or_remove_favorite_api.dart';
import 'package:ecommerce_app_project/Controller/banners_api.dart';
import 'package:ecommerce_app_project/Controller/product_details_api.dart';
import 'package:ecommerce_app_project/Controller/products_api.dart';
import 'package:ecommerce_app_project/View/Screens/product_details_screen.dart';
import 'package:ecommerce_app_project/View/Widgets/bottom_navigation_bar.dart';
import 'package:ecommerce_app_project/View/Widgets/custom_favourite_icon.dart';
import 'package:ecommerce_app_project/View/Widgets/exit_alert_dialog.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget {


  ProductsApi controller = Get.put(ProductsApi());
  BannersApi bannersApi =  Get.put(BannersApi());
  CustomFavourite customFavourite = Get.put(CustomFavourite());


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    customFavourite.fav(controller.listDataModel.length);
    return WillPopScope(
      onWillPop: (() => ExitAlertDialog().onBackPressed(context)),
      child: GetBuilder<ProductsApi>(
        builder: (controller) => Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.backgroundColor,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                (bannersApi.listDataModel.length == 0)
                    ? SizedBox(
                        height: 0,
                      )
                    : Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CarouselSlider.builder(
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2.0,
                            viewportFraction: 1.0,
                            height: 250,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration: Duration(milliseconds: 600),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          itemCount: bannersApi.listDataModel.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 5,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  child: CachedNetworkImage(
                                    imageUrl: bannersApi.listDataModel[index],
                                    fit: BoxFit.fill,
                                  )),
                            );
                          },
                        ),
                    ),
                Expanded(
                  child: (controller.listDataModel.length == 0)
                      ? Center(
                        child: CircularProgressIndicator(
                    backgroundColor: context.theme.backgroundColor,
                    color: primaryColor,
                  ),
                      )
                      : StaggeredGridView.countBuilder(
                      itemCount: controller.listDataModel.length,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            Get.put(ProductDetailsApi()).SendproductId(controller.listDataModel[index].id);
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                              return ProductDetailsScreen();
                            }));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 5,
                            color: context.theme.cardColor,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        child: CachedNetworkImage(
                                            imageUrl: controller.listDataModel[index].image),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 5,
                                        child: IconButton(
                                            onPressed: (){
                                              customFavourite.favourite(index, controller.listDataModel[index].id.toString(), context);
                                            },
                                            icon: GetBuilder<CustomFavourite>(
                                              builder: (controller) => (customFavourite.is_favorited[index])?Icon(Icons.favorite,
                                                color: Colors.red,
                                                size: 35,
                                              )
                                            :Icon(Icons.favorite_border,
                                              color: Colors.black,
                                              size: 35,
                                            ),)
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "${controller.listDataModel[index].name}",
                                      style: context.theme.textTheme.bodyText1!.copyWith(fontSize: SizeConfig.screenWidth * 0.04),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    "${controller.listDataModel[index].price} L.E. ج.م",
                                    style: context.theme.textTheme.bodyText1!.copyWith(fontSize: SizeConfig.screenWidth * 0.04),
                                  ),
                                ]),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Get.put(Bottomnavigationbar()).build(context),
        ),
      ),
    );
  }
}
