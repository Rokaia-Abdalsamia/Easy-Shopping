import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_projects/screens/auth_ui/welcome_screen.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:flutter_projects/views/home_view.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

class SplachScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
@override
void initState() {
    
    super.initState();
    Timer(Duration(seconds: 3) ,(){
      Get.offAll(()=>WelcomeScreen());
    } );
  }
  @override
  Widget build(BuildContext context) {
   // final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.kAppSeconderyColor,
        elevation: 0,
      ),
      body: 
      Container(
        alignment: Alignment.center,
        color: AppConstants.kAppSeconderyColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                      
                child: Lottie.asset('assets/images/splach-icon.json'),
                width:Get.width,
                
              ),
            ),
            Text(AppConstants.kAppPowerdBy,style: TextStyle(color: AppConstants.kAppTextColor,fontSize: 12.0,fontWeight: FontWeight.bold),),
        SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}