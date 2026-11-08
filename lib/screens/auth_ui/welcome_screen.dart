import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.kAppSeconderyColor,
        title: Text(
          'Welcome to my App',
          style: TextStyle(
            color: AppConstants.kAppTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: AppConstants.kAppMainColor,
            child: Lottie.asset('assets/images/splach-icon.json'),
            width: Get.width,
          ),
          SizedBox(height: Get.height / 40),
          Text('Happy Shopping',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          SizedBox(height: Get.height / 12),
          Container(
            decoration: BoxDecoration(
              color: AppConstants.kAppSeconderyColor,
              borderRadius: BorderRadius.circular(16),
            ),
            width: Get.width / 1.2,
            height: Get.height / 12,

            child: TextButton.icon(
              icon: Image.asset(
                'assets/images/final-google-logo.png',
                width: Get.width / 12,
                height: Get.height / 1.2,
              ),
              onPressed: () {},
              label: Text('Sign in with Google',style: TextStyle(color: AppConstants.kAppTextColor),),
            ),
          ),
        SizedBox(height: Get.height / 40),
        Container(
            decoration: BoxDecoration(
              color: AppConstants.kAppSeconderyColor,
              borderRadius: BorderRadius.circular(16),
            ),
            width: Get.width / 1.2,
            height: Get.height / 12,

            child: TextButton.icon(
              icon: Icon(Icons.email,color: AppConstants.kAppTextColor,),
              onPressed: () {},
              label: Text('Sign in with Email',style: TextStyle(color: AppConstants.kAppTextColor,),),
            ),
          ),
       
        ],
      ),
    );
  }
}
