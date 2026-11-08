import 'package:flutter/material.dart';
import 'package:flutter_projects/cubits/login/login_cubit.dart';
import 'package:flutter_projects/cubits/login/login_states.dart';
import 'package:flutter_projects/helper/widgets/custom_button.dart';
import 'package:flutter_projects/helper/widgets/custom_text_form_field.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:flutter_projects/views/home_view.dart';
import 'package:flutter_projects/views/register_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  static String LoginViewId=AppConstants.kLoginViewId;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>LoginCubit(),
      child:LoginBody()
    );
  }
}





class LoginBody extends StatefulWidget{
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final emailController =TextEditingController ();

  final passwordController =TextEditingController ();

  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  AutovalidateMode autovalidateMode= AutovalidateMode.disabled;
_login()async{
  if(!formkey.currentState!.validate()){
    autovalidateMode=AutovalidateMode.always;
    return;
  }
await BlocProvider.of<LoginCubit>(context).login(email: emailController.text, password: passwordController.text);

}
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Form(
         key: formkey,
         autovalidateMode: autovalidateMode,
         child: BlocListener<LoginCubit,LoginStates>(
           listener:(context,state){
              if(state is SuccessState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login success')));
            Navigator.pushNamed(context, HomeView.HomeViewId);
             }
             else if(state is FailureState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));

             }

           } ,

           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Spacer(flex: 2,),
               Text(
                 "Login",
                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
               ),
               SizedBox( height: 15 ),
               Text(
                 "Login now to browse our hot offers",
                 style: TextStyle(fontSize: 24),
               ),
               SizedBox( height: 15 ),
               CustomTextFormField(
                 controller:emailController ,
                 prefixIcon: Icon(Icons.email),
                 hint: "Email Address",
               ),
               SizedBox( height: 15 ),
               CustomTextFormField(
                 controller:passwordController ,
                 prefixIcon: Icon(Icons.lock),
                 hint: "Password",
                 suffixIcon: Icon(Icons.remove_red_eye_outlined),
               ),
               SizedBox( height: 15 ),
//                CustomButton(onPressed: () async{
//                  if(formkey.currentState!.validate()){
// // formkey.currentState!.save();
//                    try{
//
//
//                      Navigator.pushNamed(context, HomeView.HomeViewId);
//                    }catch(e){print(e.toString());}
//                  }else{
//
//                    autovalidateMode=AutovalidateMode.always;
//                  }
//
//                }, text: 'Login',),

             BlocBuilder<LoginCubit, LoginStates>(
               builder: (context,state){
                 if(state is LoadingState){
                   return Center(child: CircularProgressIndicator());
                 }
                 return CustomButton(onPressed: _login, text: 'Login');
               },
             ),

               SizedBox( height: 30 ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [  Text(r"Don't have an account?"),
                   TextButton(onPressed: (){

                     Navigator.pushNamed(context, RegisterView.registerViewId);
                   }, child:Text("REGESTER"))],
               ),
               Spacer(flex: 1,),
             ],
           ),

         ),
       ),
     ),
   );
  }
}





//
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Spacer(flex: 2,),
// Text(
// "Login",
// style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
// ),
// SizedBox( height: 15 ),
// Text(
// "Login now to browse our hot offers",
// style: TextStyle(fontSize: 24),
// ),
// SizedBox( height: 15 ),
// CustomTextFormField(
// controller:emailController ,
// prefixIcon: Icon(Icons.email),
// hint: "Email Address",
// ),
// SizedBox( height: 15 ),
// CustomTextFormField(
// controller:passwordController ,
// prefixIcon: Icon(Icons.lock),
// hint: "Password",
// suffixIcon: Icon(Icons.remove_red_eye_outlined),
// ),
// SizedBox( height: 15 ),
// CustomButton(onPressed: () async{
// if(formkey.currentState!.validate()){
// // formkey.currentState!.save();
// try{
//
//
// Navigator.pushNamed(context, HomeView.HomeViewId);
// }catch(e){print(e.toString());}
// }else{
//
// autovalidateMode=AutovalidateMode.always;
// }
//
// }, text: 'Login',),
// SizedBox( height: 30 ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [  Text(r"Don't have an account?"),
// TextButton(onPressed: (){
//
// Navigator.pushNamed(context, RegisterView.registerViewId);
// }, child:Text("REGESTER"))],
// ),
// Spacer(flex: 1,),
// ],
// ),