import 'package:flutter/material.dart';

import 'custom_text.dart';

class customTextFormFieldPass extends StatefulWidget {

  final String? text;
  final double fontSize;
  final String? hintText;
  final fontFamily;
  var validator;
  var keyboardType;
  var onSaved;
  final String? helperText;
  final String initialValue;
  var onEditingCompelete;
  var textInputAction;
  bool obscureText;

  customTextFormFieldPass(
      {Key? key, this.text,
        this.hintText,
        this.fontFamily = "SF Pro Display",
        this.fontSize = 14,
        this.validator,
        this.keyboardType,
        this.onSaved,
        this.helperText,
        this.initialValue = "",
        this.onEditingCompelete,
        this.textInputAction,
        this.obscureText = true}) : super(key: key);

  @override
  _customTextFormFieldPassState createState() => _customTextFormFieldPassState();
}

class _customTextFormFieldPassState extends State<customTextFormFieldPass> {

  void _toggle() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomText(
              text: widget.text!,
              fontSize: widget.fontSize,
              color: Colors.grey.shade900,
              fontFamily: widget.fontFamily,
            ),
          ),
          TextFormField(
            validator: widget.validator,
            keyboardType: TextInputType.visiblePassword,
            onSaved: widget.onSaved,
            cursorColor: Colors.black,
            obscureText: widget.obscureText,
            obscuringCharacter: "*",
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: FlatButton(
                onPressed: _toggle,
                child: Icon(
                  Icons.remove_red_eye,
                  color: widget.obscureText? Colors.black26:Colors.black54,
                ),
              ),
              filled: true,
              fillColor: Colors.grey[300],
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Color(0xffB1B1B1),),
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
          ),
        ],
      ),
    );
  }
}
