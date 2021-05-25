import 'package:desafio_gpboticario/shared/design/design_colors.dart';
import 'package:flutter/material.dart';

class SectionTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final double textScale;
  final FontWeight fontWeight;
  final Color textColor;
  final Color lineColor;
  SectionTextWidget({
    Key key,
    this.text = '',
    this.fontSize = 30,
    this.textScale = 1.2,
    this.fontWeight = FontWeight.w800,
    this.textColor = DesignColors.COLOR_DARK_BLACK,
    this.lineColor = DesignColors.COLOR_ORANGE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          textScaleFactor: textScale,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Container(
            height: 3,
            width: 70,
            decoration: BoxDecoration(
              color: lineColor,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}
