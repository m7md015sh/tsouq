import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsouq/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  FontWeight fontWeight;
  double size;
  final TextAlign align;
  final String fontFamily;
  TextOverflow overflow;
  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
        this.fontWeight=FontWeight.w400,
        this.align=TextAlign.right,
        this.fontFamily='Roboto',
      this.overflow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      textAlign: align,
      style: TextStyle(
        color: color,

        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontSize:size==0?Dimensions.font20:size,
      ),
    );
  }
}
