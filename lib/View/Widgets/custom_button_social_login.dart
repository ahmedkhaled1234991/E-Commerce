import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final fontFamily;
  final double fontSize;
  final String imageName;
  var onPress;

  CustomButtonSocial({
    required this.text,
    required this.fontFamily,
    required this.fontSize,
    required this.imageName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(11),
        color: (Get.isDarkMode)?context.theme.cardColor:Colors.grey.shade50,
      ),
      child: FlatButton(
        onPressed: onPress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            SvgPicture.asset(imageName),
            SizedBox(
              width: MediaQuery.of(context).size.width/5,
            ),
            CustomText(
              text: text,
              fontSize: fontSize,
              fontFamily: fontFamily,
            ),
          ],
        ),
      ),
    );
  }
}
