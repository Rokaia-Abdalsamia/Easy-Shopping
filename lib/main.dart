import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/screens/auth_ui/sign_in_screen.dart';
import 'package:flutter_projects/screens/auth_ui/sign_up_screen.dart';
import 'package:flutter_projects/screens/auth_ui/splach_screen.dart';
import 'package:flutter_projects/views/category_view.dart';
import 'package:flutter_projects/views/flash_sale_view.dart';
import 'package:flutter_projects/views/home_view.dart';
import 'package:flutter_projects/views/login_view.dart';
import 'package:flutter_projects/views/products_view.dart';
import 'package:flutter_projects/views/register_view.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // routes: {
      //   LoginView.LoginViewId: (context) => LoginView(),
      //   RegisterView.registerViewId: (context) => RegisterView(),
      //   HomeView.HomeViewId: (context) => HomeView(),
      //   CategoryView.categoryViewId:(context)=>CategoryView(),
      //   ProductsView.productViewId:(context) => ProductsView(),
      //   FlashSaleView.FlashSaleViewId:(context) => FlashSaleView(),
      // },
      // initialRoute:  HomeView.HomeViewId,
      home: SignUpScreen(),
    );
  }
}