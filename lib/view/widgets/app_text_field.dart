import 'package:flutter/material.dart';
import 'package:tsouq/utils/colors.dart';
import 'package:tsouq/utils/dimensions.dart';

class AppTextField extends StatelessWidget {
   TextEditingController? textController;
  final String hintText;
  final IconData icon;
  bool isObscure;
   FormFieldValidator? validator;
  FormFieldValidator? onSave;
   AppTextField({Key? key, this.textController,required this.hintText,required this.icon,this.isObscure=false, this.validator,this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(1,1),
                color: Colors.grey.withOpacity(0.2)
            )
          ]
      ),
      child: TextFormField(
        onSaved: onSave,
        validator: validator,
        obscureText: isObscure?true:false,
        controller: textController,

        decoration: InputDecoration(
          //hintText,
          hintText: hintText,
          //prefixIcon
          prefixIcon: Icon(icon,color: AppColors.yellowColor,),
          //focusedBorder
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.white
              )
          ),
          //enabledBorder
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            borderSide: BorderSide(
                width: 1.0,
                color: Colors.white
            ),
          ),

          //border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius30),

          ),
        ),
      ),
    );
  }
}
