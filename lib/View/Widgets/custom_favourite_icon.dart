import 'package:ecommerce_app_project/Controller/add_or_remove_favorite_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavourite extends GetxController{

  List is_favorited=[];

  fav(int length){
    for(int i=0 ;i<length;i++){
      is_favorited.add(false);
    }
  }

  favourite(int index, String id, BuildContext context){
    if(is_favorited[index]){
      is_favorited[index]=false;
      Get.put(AddOrRemoveFavoriteApi(id)
          .addOrRemoveFavorite().then((value) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
          content: Text(
            value,
            textAlign: TextAlign.right,
          )))));
    }else{
      is_favorited[index]=true;
      Get.put(AddOrRemoveFavoriteApi(id)
          .addOrRemoveFavorite().then((value) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
          content: Text(
            value,
            textAlign: TextAlign.right,
          )))));
    }
    update();
  }

}