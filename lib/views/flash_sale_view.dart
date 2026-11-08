import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:flutter_projects/helper/widgets/category_item.dart';
import 'package:flutter_projects/helper/widgets/custom_app_bar.dart';
import 'package:flutter_projects/helper/widgets/flashSale_item.dart';
import 'package:flutter_projects/helper/widgets/product_item.dart';
import 'package:flutter_projects/models/catiegory_model.dart';
import 'package:flutter_projects/models/product_model.dart';
import 'package:flutter_projects/services/firebase_firestore.dart';
import 'package:flutter_projects/views/products_view.dart';

class FlashSaleView extends StatefulWidget {
  static String FlashSaleViewId = AppConstants.kFlashSaleViewId;
  @override
  State<FlashSaleView> createState() => _FlashSaleViewState();
}

class _FlashSaleViewState extends State<FlashSaleView> {
  MyFirebaseFirestore myFirebaseFirestore = MyFirebaseFirestore();

  List<ProductModel> flashSaleProductsList = [];
  void initState() {
    super.initState();

    getflashSaleProductsList();
  }

  void getflashSaleProductsList() async {
    flashSaleProductsList = await myFirebaseFirestore.readProductSale();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Flash Sale',
            leftIcon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              
            ),
            rightIcon: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: flashSaleProductsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) => FlashsaleItem(
                  image: flashSaleProductsList[index].image,
                  title: flashSaleProductsList[index].name,
currentPrice:flashSaleProductsList[index].currentPrice ,
prePrice: flashSaleProductsList[index].prePrice!,
                 // imageHeight: 120,
                  onTap: () {
                  //product details
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
