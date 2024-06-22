import 'package:flutter/material.dart';
import 'package:tsouq/utils/colors.dart';
TextStyle headingStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
    fontFamily: 'Cairo'
);
TextStyle contentStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: 'Cairo'
);
LinearGradient gradientStyle = LinearGradient(
    colors: [AppColors.mainColor,AppColors.mainDarkColor],
    stops: [0,1],
    begin: Alignment.topCenter
);