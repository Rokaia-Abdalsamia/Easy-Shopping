import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  @override
  final Icon prefixIcon;
  final Icon? suffixIcon;
 final  String hint;
  //final   TextEditingController controller=TextEditingController();
  // void Function(String?)? onSaved;
 TextEditingController controller;
   CustomTextFormField({required this.prefixIcon,this.suffixIcon,required this.hint ,required this.controller});



  @override
  Widget build(BuildContext context) {
   
 return  TextFormField(
  validator: (value) {
    if(value==null || value.isEmpty ){
      return "this field is required ";
    }
    
  },
controller: controller,
decoration: InputDecoration(
  prefixIcon: prefixIcon,
  suffixIcon: suffixIcon,
  hint: Text(hint),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),

),
   );
  }
}

// class _CustomTextFormFieldState extends State<CustomTextFormField> {

// }