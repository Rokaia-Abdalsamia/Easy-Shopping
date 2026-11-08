import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_projects/helper/widgets/custom_text_field.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return  KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign in',
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
          isKeyboardVisible?Text('Welcome to my app'):
          Container(
            color: AppConstants.kAppSeconderyColor,
            child: Lottie.asset('assets/images/splach-icon.json'),
            width: Get.width,
            height: Get.height/2.4,
          ),
          SizedBox(height: Get.height / 12),
   
          CustomTextField(lable: 'Email', keyboardType: TextInputType.emailAddress,prefixIcon: Icon(Icons.email),),
           SizedBox(height: Get.height/90,),
            CustomTextField(lable: 'Password', keyboardType: TextInputType.text,prefixIcon: Icon(Icons.password),suffixIcon: Icon(Icons.visibility_off_sharp),),
      Container(alignment: Alignment.topRight,
        child: TextButton(onPressed: (){}, child: Text('Forget Password?',style: TextStyle(color: AppConstants.kAppSeconderyColor,fontWeight: FontWeight.bold),))),
              SizedBox(height: Get.height/40,),
               Container(
            decoration: BoxDecoration(
              color: AppConstants.kAppSeconderyColor,
              borderRadius: BorderRadius.circular(20),
            ),
            width: Get.width / 2.5,
            height: Get.height / 18,

            child: TextButton.icon(
    
              onPressed: () {},
              label: Text('Sign in',style: TextStyle(color: AppConstants.kAppTextColor,),),
            ),

          ),
           SizedBox(height: Get.height/30,),
       Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Don't have an account?",style: TextStyle(color: AppConstants.kAppSeconderyColor)),TextButton(onPressed: (){}, child: Text('Sign up',style: TextStyle(color: AppConstants.kAppSeconderyColor,fontWeight: FontWeight.bold)))],)
        ],
        
      ),
    );
 
      }
  );
  }
}
