import 'package:ecommerce_app_project/Controller/add_or_remove_cart_api.dart';
import 'package:ecommerce_app_project/Controller/cart_total_api.dart';
import 'package:ecommerce_app_project/Controller/get_carts_api.dart';
import 'package:ecommerce_app_project/Controller/update_cart_api.dart';
import 'package:ecommerce_app_project/View/Widgets/bottom_navigation_bar.dart';
import 'package:ecommerce_app_project/View/Widgets/exit_alert_dialog.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'delivery_screen.dart';

class CartScreen extends GetWidget {
  //chceck variable to know navigate to cart screen from any screen
  bool check;

  CartScreen(this.check);

  AddOrRemoveCartApi addOrRemoveCart = Get.put(AddOrRemoveCartApi());
  GetCartsApi getCarts = Get.put(GetCartsApi());
  UpdateCartApi updateCart = Get.put(UpdateCartApi());
  CartTotalApi getCartsTotal = Get.put(CartTotalApi());


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    getCartsTotal.gettotal();
    return WillPopScope(
      onWillPop: (() => ExitAlertDialog().onBackPressed(context)),
      child: GetBuilder<GetCartsApi>(
        builder: (controller) => Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.backgroundColor,
            elevation: 0.0,
          ),
          body: FutureBuilder(
                initialData: [],
                future: getCarts.getCarts(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  updateCart.count(snapshot.data.length);
                  if (snapshot.hasData) {
                    if(snapshot.data.length == 0 && snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: context.theme.backgroundColor,
                          color: primaryColor,
                        ),
                      );
                    }else if(snapshot.data.length == 0 && snapshot.connectionState == ConnectionState.done){
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: SizeConfig.screenHeight / 2.2,
                                width: SizeConfig.screenWidth / 1.09,
                                child: Image.asset(
                                  'assets/images/Cart background.png',
                                )),
                            SizedBox(
                              height: SizeConfig.screenHeight / 50,
                            ),
                            /*Text("Empty Cart",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                          ),*/
                          ],
                        ),
                      );
                    }
                    else {
                      return Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: SizeConfig.screenHeight / 80),
                              child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Slidable(
                                              actionPane: const SlidableDrawerActionPane(),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(20))),
                                                elevation: 5,
                                                color: Colors.grey[500],
                                                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(SizeConfig.screenWidth / 50),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .end,
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets.only(right: SizeConfig.screenWidth / 30),
                                                            width: SizeConfig.screenWidth / 1.5,
                                                            child: Text("${snapshot.data[index].name}",
                                                              style: context.theme.textTheme.headline3!.copyWith(fontSize: SizeConfig.screenWidth * 0.043),
                                                              textAlign: TextAlign
                                                                  .right,
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left: SizeConfig.screenWidth / 2.5),
                                                                child: Text(
                                                                  "جنيه",
                                                                  style: context.theme.textTheme.headline3!.copyWith(fontSize: SizeConfig.screenWidth * 0.038),
                                                                  textAlign: TextAlign
                                                                      .right,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(left: 5),
                                                                child: Text("${snapshot.data[index].price}",
                                                                  style: context.theme.textTheme.headline3!.copyWith(fontSize: SizeConfig.screenWidth * 0.038),
                                                                  textAlign: TextAlign
                                                                      .right,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height: SizeConfig.screenHeight / 80),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .only(left: SizeConfig.screenWidth / 4),
                                                            child: Container(
                                                              height: 30,
                                                              width: 115,
                                                              color: Colors.black45,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  IconButton(
                                                                    onPressed: () async {
                                                                      updateCart.changequant(index, 1);
                                                                      getCartsTotal.gettotal();
                                                                      String message = await updateCart.updateCart(getCarts.listDataModelId[index]);
                                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                              content: Text(message, textAlign: TextAlign.right,)));
                                                                    },
                                                                    icon: Icon(
                                                                      Icons.remove,
                                                                      size: 15,
                                                                    color: Colors.white,),
                                                                  ),
                                                                  GetBuilder<
                                                                      UpdateCartApi>(
                                                                      builder: (controller) => Text("${updateCart.counter[index]}")),
                                                                  IconButton(
                                                                    onPressed: () async {
                                                                      updateCart.changequant(index, 2);
                                                                      getCartsTotal.gettotal();
                                                                      String message = await updateCart.updateCart(getCarts.listDataModelId[index]);
                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                          SnackBar(content: Text(message,
                                                                                textAlign: TextAlign.right,)));
                                                                    },
                                                                    icon: Icon(
                                                                      Icons.add,
                                                                      size: 15,
                                                                      color: Colors.white,),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: SizeConfig.screenWidth / 170),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: SizeConfig.screenWidth / 140),
                                                      child: Container(
                                                        height: SizeConfig.screenHeight / 4.8,
                                                        width: SizeConfig.screenWidth / 3.8,
                                                        child: ClipRRect(
                                                          borderRadius:BorderRadius.only(topRight: Radius.circular(20),
                                                          bottomRight: Radius.circular(20)),
                                                          child: Image.network(
                                                            snapshot.data[index]
                                                                .image,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                IconSlideAction(
                                                  foregroundColor: Colors.white,
                                                  caption: 'Delete',
                                                  color: Colors.red,
                                                  iconWidget: const Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  onTap: () {
                                                    addOrRemoveCart.addOrRemoveCart(snapshot.data[index].id.toString()).then((
                                                        value) =>
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(SnackBar(content: Text(
                                                              value,
                                                              textAlign: TextAlign.right,))));
                                                    //getCarts.onClose;
                                                    //getCarts.onDelete;
                                                    getCartsTotal.gettotal();
                                                    getCarts.update();
                                                  },
                                                ),
                                              ],
                                            );
                                  }),
                            ),
                          /*Positioned(
                            bottom: 10,
                              right: 10,
                              child: Container(
                                height: 70.0,
                                width: 70.0,
                                child: FloatingActionButton(
                                    backgroundColor: primaryColor,
                                    child: Icon(Icons.add, size: 35,),
                                    onPressed: (){

                                    }),
                              ),
                          ),*/
                          Positioned(
                            bottom: 0,
                            child: Container(
                              color: context.theme.backgroundColor,
                              height: 70,
                              width: SizeConfig.screenWidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "TOTAL",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: SizeConfig.screenWidth * 0.038
                                          ),
                                        ),
                                        GetBuilder<CartTotalApi>(
                                          builder: (controller) => Text(
                                              "${getCartsTotal.total}",
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontSize: SizeConfig.screenWidth * 0.052,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: SizeConfig.screenWidth/2.6,),
                                  MaterialButton(
                                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 19),
                                    height: 50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(4))),
                                    color: primaryColor,
                                      onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                        return DeliveryScreen();
                                      }));
                                      },
                                      child: Text(
                                          "CHECKOUT",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: SizeConfig.screenWidth * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    }else{
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: context.theme.backgroundColor,
                        color: primaryColor,
                      ),
                    );
                  }
                  }),
          bottomNavigationBar:
              Get.put(Bottomnavigationbar()).fromProduct(check, context),
        ),
      ),
    );
  }
}
