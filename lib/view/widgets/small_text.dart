import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tsouq/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  final TextAlign align;
  dynamic height;
  final String fontFamily;
  SmallText(
      {Key? key,
        this.color = const Color(0xff6f6c6a),
        required this.text,
        this.size = 0,
        this.align=TextAlign.start,
        this.height=1.2,
        this.fontFamily='Roboto',
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

      text,

      textAlign: align,

      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
          fontSize:size==0?Dimensions.font12:size,
        height: height,
          fontWeight: FontWeight.w500,
      ),
    );
  }
}
