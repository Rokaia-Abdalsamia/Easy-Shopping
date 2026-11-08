
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/cubits/login/login_states.dart';

import '../../services/firebase_authantication.dart';
class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(InitialState());

 Future<void>  login({required String email,required String password})async{
    emit(LoadingState());
    try {
      await FirebaseAuthantication(emailAddress: email,password: password).signInWithEmailAndPassword();

      emit(SuccessState());
    } on Exception catch (e) {
      emit(FailureState(e.toString()));
    }
  }


}

