import 'package:flutter/material.dart';



import '../utils/app_constants.dart';
import '../helper/widgets/custom_button.dart';
import '../helper/widgets/custom_text_form_field.dart';
import '../services/firebase_authantication.dart';
import 'home_view.dart';
import 'login_view.dart';
class RegisterView extends StatelessWidget {
  static  String registerViewId=AppConstants.kRegisterViewId;
 // late String emailAddress,password ;
  final emailController =TextEditingController ();
  final passwordController =TextEditingController ();
  final userNameController =TextEditingController ();
  final phoneController =TextEditingController ();
 GlobalKey<FormState> formkey=GlobalKey<FormState>();
 AutovalidateMode autovalidateMode= AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key:formkey ,
          autovalidateMode: autovalidateMode,
          child: Expanded(
            child: SingleChildScrollView(
              child: Container(
                height:900,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 2,),
                    Text(
                      "Register",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                     SizedBox( height: 15 ),
                    Text(
                      "Regester Now to communicate with friends",
                      style: TextStyle(fontSize: 24),
                    ),
                      SizedBox( height: 30 ),
                    CustomTextFormField(
                      controller:userNameController ,
                      prefixIcon: Icon(Icons.person),
                      hint: "User Name",

                    ),
                    SizedBox( height: 15 ),
                    CustomTextFormField(
                      prefixIcon: Icon(Icons.email),
                      hint: "Email Address",
                    controller: emailController,
                    ),
                    SizedBox( height: 15 ),
                    CustomTextFormField(
                      controller: passwordController,
                      prefixIcon: Icon(Icons.lock),
                      hint: "Password",

                      suffixIcon: Icon(Icons.remove_red_eye_outlined),

                    ),
                      SizedBox( height: 15 ),
                    CustomTextFormField(
                      controller: phoneController,
                      prefixIcon: Icon(Icons.phone),
                      hint: "Phone",
                    ),
                    SizedBox( height: 30 ),
                    CustomButton(onPressed: () async{   if (formkey.currentState!.validate()) {
                      // formkey.currentState!.save();
                      try {
                      await FirebaseAuthantication(
                            emailAddress: emailController.text, password: passwordController.text)
                            .createUserWithEmailAndPassword();
                      Navigator.pushNamed(context, HomeView.HomeViewId);
                      } catch (e) {
                        print("error in auth:$e.");
                      }


                    }
                    else{
                      autovalidateMode=AutovalidateMode.always;
                    }
                    }, text: 'Regester',),
                    SizedBox( height: 30 ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [  Text(r"have an account?"),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, LoginView.LoginViewId);
                      }, child:Text("Login"))],
                    ),
                    Spacer(flex: 1,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}