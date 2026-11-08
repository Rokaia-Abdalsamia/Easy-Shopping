import 'package:flutter/material.dart';

class MangeKeyboard {
  static void hideKLeyboard(BuildContext context){
    FocusScopeNode currentFocus=FocusScope.of(context);
    if(!currentFocus.hasPrimaryFocus){
      currentFocus.unfocus();
    }
  }
}