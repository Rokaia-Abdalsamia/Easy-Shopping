import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  String lable;
  Icon? prefixIcon,suffixIcon;
  TextInputType keyboardType;
CustomTextField({super.key, required this.lable,this.prefixIcon,this.suffixIcon,required this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return Container(
            width: Get.width/1.1,
           
            child: TextField(
              keyboardType: keyboardType,
              cursorColor: AppConstants.kAppSeconderyColor,
              decoration: InputDecoration(
                label: Text(lable),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                
                border: OutlineInputBorder(
                
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
     ;
  }
}