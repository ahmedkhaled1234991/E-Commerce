import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import 'custom_cupertino_switch.dart';

class CustomText extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color color;

  final Alignment alignment;

  //final int maxLine;
  final double height;

  final FontWeight fontWeight;

  final fontFamily;

  CustomText({
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    //this.maxLine,
    this.height = 1,
    this.fontWeight = FontWeight.w500,
    this.fontFamily = "SF Pro Display",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
          text.tr().toString(),
          style: context.theme.textTheme.headline3!.copyWith(
            height: height,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
          ),
          //maxLines: maxLine,
        ),
    );
  }
}
