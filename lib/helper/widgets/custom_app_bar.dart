import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/utils/app_constants.dart';

class CustomAppBar extends StatelessWidget{
  final Widget? leftIcon;
  final List<Widget>? rightIcon;
final String title;
  CustomAppBar({ this.leftIcon,
  this.rightIcon,required this.title});
  @override
  Widget build(BuildContext context) {
   return AppBar(
     backgroundColor: AppConstants.kAppMainColor,
     systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:  AppConstants.kAppStatusBarColor,
      statusBarIconBrightness: Brightness.light
     ),
title: Text(title, style: TextStyle(color: Colors.white)),
centerTitle: true,
leading:leftIcon,
actions: rightIcon
   );
    // return Container(
    //   width: double.infinity,
    //   height: 70,
    //   color: kAppColor,
    //   child: Row(children: [
    //     leftIcon??Text(''),
    //     Spacer(),
    //     Text(title, style: TextStyle(color: Colors.white)),
    //     Spacer(),
    //    rightIcon??Text(''),
    //   ],),
    // );

  }
}
//

// )