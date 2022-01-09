import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_project/Controller/add_or_remove_cart_api.dart';
import 'package:ecommerce_app_project/Controller/product_details_api.dart';
import 'package:ecommerce_app_project/Model/products_model.dart';
import 'package:ecommerce_app_project/View/Widgets/bottom_navigation_bar.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_screen.dart';

class ProductDetailsScreen extends GetWidget {

  ProductDetailsApi productDetails = Get.put(ProductDetailsApi());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<ProductDetailsApi>(
      builder: (controller) => Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: (controller.images.length == 0)
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: context.theme.backgroundColor,
                    color: primaryColor,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 2.0,
                          viewportFraction: 1.0,
                          height: 250,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 600),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemCount: controller.images.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 5,
                            color: Colors.grey,
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: CachedNetworkImage(
                                  imageUrl: controller.images[index],
                                  fit: BoxFit.fill,
                                  width: SizeConfig.screenWidth,
                                )),
                          );
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight / 40,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "${controller.name}",
                          style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.055),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight / 200,
                      ),
                      (controller.price != 0)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "جنيه",
                                  style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.045),
                                ),
                                Text(
                                  "${controller.price}",
                                  style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.045),
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      (controller.old_price != 0)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                (controller.old_price != controller.price)
                                    ? Text(
                                        "جنيه",
                                        style: context.theme.textTheme.headline6!.copyWith(decorationColor: Colors.black,decorationStyle: TextDecorationStyle.solid, decoration:
                                        TextDecoration.lineThrough, decorationThickness: 3,),
                                      )
                                    : SizedBox(
                                        height: 0,
                                      ),
                                (controller.old_price != controller.price)
                                    ? Text(
                                        "${controller.old_price}",
                                        style: context.theme.textTheme.headline6!.copyWith( decorationColor: Colors.black,decorationStyle: TextDecorationStyle.solid, decoration:
                                        TextDecoration.lineThrough,decorationThickness: 4,),
                                      )
                                    : SizedBox(
                                        height: 0,
                                      ),
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      (controller.discount != 0)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "%",
                                  style: context.theme.textTheme.headline6!.copyWith(fontSize: SizeConfig.screenWidth * 0.045),
                                ),
                                Text(
                                  "${controller.discount}",
                                  style: context.theme.textTheme.headline6!.copyWith(fontSize: SizeConfig.screenWidth * 0.045),
                                ),
                                Text(
                                  " خصم",
                                  style: context.theme.textTheme.headline6!.copyWith(fontSize: SizeConfig.screenWidth * 0.045),
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      SizedBox(
                        height: SizeConfig.screenHeight / 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "${controller.description}",
                            style: context.theme.textTheme.headline3!.copyWith(fontWeight: FontWeight.bold, fontSize: SizeConfig.screenWidth * 0.037),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        floatingActionButton: Container(
          height: 70.0,
          width: 70.0,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {
                  Get.put(
                      AddOrRemoveCartApi()
                          .addOrRemoveCart(controller.productId.toString())
                          .then((value) => ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                value,
                                textAlign: TextAlign.right,
                              )))));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return CartScreen(true);
                  }));
              },
              child: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
