import 'package:flutter/material.dart';
import '../../constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double fontSize;

  final Color color;

  var onPress;

  final fontFamily;

  CustomButton({
    @required this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor,
    this.fontFamily = "SF Pro Display",
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(15),
      onPressed: onPress,
      color: primaryColor,
      child: CustomText(
        alignment: Alignment.center,
        text: text,
        fontSize: fontSize,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
    );
  }
}
