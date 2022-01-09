import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_project/Controller/get_favorites_api.dart';
import 'package:ecommerce_app_project/Controller/product_details_api.dart';
import 'package:ecommerce_app_project/View/Screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class Favoritescreen extends GetWidget{

  GetFavoritesApi getFavorites = Get.put(GetFavoritesApi());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetFavoritesApi>(
      builder: (controller) => Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primaryColor,
          title: Text(
            "Favorites",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
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
        body: FutureBuilder(
          future: getFavorites.getFavorites(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData){
              if(snapshot.data.length == 0){
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: SizeConfig.screenHeight / 2.2,
                          width: SizeConfig.screenWidth / 1.09,
                          child: Image.asset(
                            'assets/images/Favourite.png',
                          )),
                      SizedBox(
                        height: SizeConfig.screenHeight / 20,
                      ),
                      /*Text("Empty Favourite",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                          ),*/
                    ],
                  ),
                );
              }else{
                return StaggeredGridView.countBuilder(
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
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: CachedNetworkImage(
                                      imageUrl: controller.listDataModel[index].image),
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
                    });
              }
            }else{
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: context.theme.backgroundColor,
                  color: primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
