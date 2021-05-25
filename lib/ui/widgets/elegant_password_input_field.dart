import 'package:desafio_gpboticario/shared/design/design_colors.dart';
import 'package:flutter/material.dart';

class ElegantPasswordInputWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool isObscureText;
  final Function onTap;
  ElegantPasswordInputWidget({
    Key key,
    this.text,
    this.controller,
    this.isObscureText,
    this.onTap,
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
        obscureText: isObscureText,
        decoration: InputDecoration(
          hintText: text,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: new Icon(
              !isObscureText ? Icons.visibility : Icons.visibility_off,
              color: DesignColors.COLOR_ORANGE,
            ),
          ),
        ),
      ),
    );
  }
}
