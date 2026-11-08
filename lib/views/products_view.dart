import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:flutter_projects/helper/widgets/custom_app_bar.dart';

class ProductsView  extends StatelessWidget{
static  final productViewId=AppConstants.kProductViewId;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Column(
      children: [
        CustomAppBar(title: 'Products', rightIcon: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {},
              ),
            ],),

      ],
    ),
   );
  }
}