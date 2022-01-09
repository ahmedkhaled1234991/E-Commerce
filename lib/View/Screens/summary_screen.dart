import 'package:ecommerce_app_project/Controller/add_order_api.dart';
import 'package:ecommerce_app_project/Controller/get_addresses_api.dart';
import 'package:ecommerce_app_project/Controller/get_carts_api.dart';
import 'package:ecommerce_app_project/Model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'address_screen.dart';


class SummaryScreen extends GetWidget{

  GetCartsApi controller = Get.put(GetCartsApi());
  AddOrderApi addOrder = Get.put(AddOrderApi());
  GetAddressesApi getAddresses = Get.put(GetAddressesApi());


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<GetCartsApi>(
      builder: (controller) => Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          title: Text("Summary",
            style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.06),),
          centerTitle: true,
          elevation: 0.0,
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: SizeConfig.screenWidth,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: SizeConfig.screenWidth / 2.5,
                      height: SizeConfig.screenHeight / 1.5,
                      child: Card(
                        color: Colors.grey[500],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius:BorderRadius.only(topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                                child: Image.network(controller.listData[index].image,height: SizeConfig.screenHeight / 7,width: SizeConfig.screenWidth / 2.5, fit: BoxFit.fill,)),
                            Padding(
                              padding: EdgeInsets.all(SizeConfig.screenWidth / 70),
                              child: Text(
                                "${controller.listData[index].name}",
                                style: context.theme.textTheme.headline3!.copyWith(fontSize: SizeConfig.screenWidth * 0.029),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
              ),
              SizedBox(height: SizeConfig.screenHeight / 40,),
              Text(
                "Shipping Address",
                style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.05),
              ),
              SizedBox(height: SizeConfig.screenHeight / 40,),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: SizeConfig.screenHeight / 3.6),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: getAddresses.listDataModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${getAddresses.listDataModel[index].name}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                Text("${getAddresses.listDataModel[index].details}\n${getAddresses.listDataModel[index].region}\n${getAddresses.listDataModel[index].city}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(left: SizeConfig.screenWidth / 1.8),
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        color: primaryColor,
                        onPressed: () async{
                          addOrder.getDataOrder(getAddresses.listDataModel[0].id, 1);
                          await addOrder.addOrder();
                          String message = addOrder.message;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(message, textAlign: TextAlign.right,)));
                          /*Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                        return SummaryScreen();
                      }));*/
                        },
                        child: Text(
                          "Deliver ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //SizedBox(height: MediaQuery.of(context).size.height / 100,),

            ],
          ),
        ),
      ),
    );
  }
}
