import 'package:ecommerce_app_project/View/Screens/summary_screen.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DeliveryScreen extends GetWidget {

  int? groupvalue;
  //int value = 1;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        title: Text("Checkout",
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
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  child: TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.start,
                    indicatorStyle: IndicatorStyle(
                        width: 30,
                        height: 30,
                        color: context.theme.backgroundColor,
                        indicatorXY: 0,
                        iconStyle: IconStyle(
                            iconData:
                                IconData(58627, fontFamily: 'MaterialIcons'),
                            color: primaryColor,
                            fontSize: 40)),
                    afterLineStyle: LineStyle(color: primaryColor),
                    beforeLineStyle: LineStyle(color: primaryColor),
                    hasIndicator: true,
                  ),
                ),
                Container(
                  height: 30,
                  child: TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.start,
                    indicatorStyle: IndicatorStyle(
                        width: 30,
                        height: 30,
                        color: context.theme.backgroundColor,
                        indicatorXY: 1,
                        iconStyle: IconStyle(
                            iconData:
                                IconData(58628, fontFamily: 'MaterialIcons'),
                            color: primaryColor,
                            fontSize: 40)),
                    afterLineStyle: LineStyle(color: primaryColor),
                    beforeLineStyle: LineStyle(color: primaryColor),
                    hasIndicator: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth / 4),
                  child: Text(
                    "Delivary",
                    style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.04),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 6),
                  child: Text(
                    "Summary",
                    style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.04),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 15,
            ),
            Text(
              "Standard Delivery",
              style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.05),
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 30,
            ),
            Row(
              children: [
                Text("Order will be delivered between 3 - 5 business \ndays",
                style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.04),
                ),
                Spacer(),
                Radio(
                  activeColor: primaryColor,
                    value: 1,
                    groupValue: groupvalue,
                    onChanged: ((int? value){
                      groupvalue = value!;
                    }),
                ),

              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 25,
            ),
            Text(
              "Next Day Delivery",
              style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.05),
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 30,
            ),
            Row(
              children: [
                Text("Place your order before 6pm and your items \nwill be delivered the next day",
                  style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.04),
                ),
                Spacer(),
                Radio(
                  activeColor: primaryColor,
                  value: 2,
                  groupValue: groupvalue,
                  onChanged: ((int? value){
                    groupvalue = value!;
                  }),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 25,
            ),
            Text(
              "Nominated Delivery",
              style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.05),
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 30,
            ),
            Row(
              children: [
                Text("Pick a particular date from the calendar\nand order will be delivered on selected date",
                  style: context.theme.textTheme.headline2!.copyWith(fontSize: SizeConfig.screenWidth * 0.04),
                ),
                Spacer(),
                Radio(
                  activeColor: primaryColor,
                  value: 2,
                  groupValue: groupvalue,
                  onChanged: ((int? value){
                    groupvalue = value!;
                  }),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 5,
            ),
            Container(
              margin: EdgeInsets.only(left: SizeConfig.screenWidth / 1.7),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 60),
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                color: primaryColor,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return SummaryScreen();
                  }));
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
