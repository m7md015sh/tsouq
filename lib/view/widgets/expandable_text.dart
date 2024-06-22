import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';

import 'small_text.dart';


class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key,required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  
  bool hiddenText=true;
  
  double textHeight=Dimensions.screenHeight/9.22;
  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf=widget.text.substring(0,textHeight.toInt());
      secondHalf=widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      child: secondHalf.isEmpty?SmallText(height:2.00,color:AppColors.paraColor,align: TextAlign.right ,text: firstHalf,size: Dimensions.font16,):Column(
        children: [
          SmallText(height:2.00,color:AppColors.titleColor,size: Dimensions.font12,fontFamily: 'Cairo',align: TextAlign.right,text: hiddenText?(firstHalf+'...'):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: hiddenText?"Show more".tr:"Show less".tr,color: AppColors.mainColor,),
                  Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
 