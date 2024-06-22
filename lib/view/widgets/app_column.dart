import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';


import 'big_text.dart';
import 'icon_and_text_widget.dart';
import 'small_text.dart';

Widget AppColumn(String text)=>Column(

  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    BigText(text: text),
    SizedBox(
      height: Dimensions.height10,
    ),
    Container(
      width: double.infinity,

      // height: Dimensions.height20,

      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Wrap(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color: AppColors.mainColor,
                size: Dimensions.iconSize10,
              );
            }),
          ),
          SizedBox(
            width: Dimensions.width10,
          ),
          SmallText(
            text: '4.5',
          ),
          SizedBox(
            width: Dimensions.width15,
          ),
          SmallText(
            text: '1287',
          ),
          SizedBox(
            width: Dimensions.width10,
          ),
          SmallText(
            text: 'comments',
          )
        ],
      ),
    ),
    SizedBox(
      height: Dimensions.height15,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconAndText(
          text: 'fast delivery ',
          IconColor: AppColors.iconColor1,
          icon: Icons.delivery_dining,
        ),
        IconAndText(
          text: 'easy shopping',
          IconColor: AppColors.mainColor,
          icon: Icons.shopping_bag,
        ),
        // IconAndText(
        //   text: '32min',
        //   IconColor: AppColors.iconColor2,
        //   icon: Icons.access_time_rounded,
        // ),
      ],
    ),
  ],
);