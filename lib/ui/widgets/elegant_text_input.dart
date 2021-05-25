import 'package:flutter/material.dart';

class ElegantTextInputWidget extends StatelessWidget {
  final String text;
  final int maxLength;
  final int maxLines;
  final String counterText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType textInputType;
  ElegantTextInputWidget({
    Key key,
    this.text,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.textInputType = TextInputType.text,
    this.counterText = "",
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: text,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          counterText: counterText,
        ),
      ),
    );
  }
}
