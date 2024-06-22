import 'package:flutter/material.dart';
import 'package:tsouq/utils/dimensions.dart';

import '../../../utils/colors.dart';

class ImageBigger extends StatelessWidget {
  final String iamge;

  ImageBigger({Key? key,required this.iamge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:AppColors.mainBlackColor,elevation: 0.0,),
      body:  Container(
          decoration: BoxDecoration(

              color: AppColors.mainBlackColor,
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(iamge)))
      ),
    );
  }
}
