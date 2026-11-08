import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_projects/helper/widgets/custom_text_field.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Sign Up',
              style: TextStyle(
                color: AppConstants.kAppTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            backgroundColor: AppConstants.kAppSeconderyColor,
            elevation: 0,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 50),
                child: Text(
                  'Welcome to my app',
                  style: TextStyle(
                    color: AppConstants.kAppSeconderyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ),
              // SizedBox(height: Get.height / 12),

              SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      lable: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email),
                    ),
                     SizedBox(height: Get.height / 30),
                CustomTextField(
                  lable: 'UserName',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.person),
                ),
                SizedBox(height: Get.height / 30),
                CustomTextField(
                  lable: 'Phone',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icon(Icons.phone),
                ),
                SizedBox(height: Get.height / 30),
                   CustomTextField(
                      lable: 'City',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.location_on),
                    ),
                     SizedBox(height: Get.height / 30),
                CustomTextField(
                  lable: 'Password',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.visibility_off_sharp),
                ),
                      SizedBox(height: Get.height/15,),
                Container(
                  decoration: BoxDecoration(
                    color: AppConstants.kAppSeconderyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: Get.width / 2.5,
                  height: Get.height / 18,
                
                  child: TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Sign Up',
                      style: TextStyle(color: AppConstants.kAppTextColor),
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: AppConstants.kAppSeconderyColor),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: AppConstants.kAppSeconderyColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                  ],
                ),
              ),
             
            ],
          ),
        );
      },
    );
  }
}
