import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? hint;
  final fontFamily;
  final double fontSize;
  var onSave;
  var validator;
  var keyboardType;

  CustomTextFormField({Key? key,
    this.text,
    this.hint,
    this.fontFamily = "SF Pro Display",
    this.fontSize= 14,
    this.onSave,
    this.validator,
    this.keyboardType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomText(
              text: text!,
              fontSize: fontSize,
              color: Colors.grey.shade900,
              fontFamily: fontFamily,
            ),
          ),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            cursorColor: Colors.black,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[300],
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xffB1B1B1),
              ),
              contentPadding: const EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
