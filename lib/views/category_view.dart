import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:flutter_projects/helper/widgets/category_item.dart';
import 'package:flutter_projects/helper/widgets/custom_app_bar.dart';
import 'package:flutter_projects/models/catiegory_model.dart';
import 'package:flutter_projects/services/firebase_firestore.dart';
import 'package:flutter_projects/views/products_view.dart';

class CategoryView extends StatefulWidget {
  static String categoryViewId = AppConstants.kCategoryViewId;
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  MyFirebaseFirestore myFirebaseFirestore = MyFirebaseFirestore();

  List<CategoryModel> categoryList = [];
  void initState() {
    super.initState();

    getCategoryList();
  }

  void getCategoryList() async {
    categoryList = await myFirebaseFirestore.readCategory();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Categories',
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
                itemCount: categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) => CategoryItem(
                  image: categoryList[index].image,
                  title: categoryList[index].name,
                  imageHeight: 120,
                  onTap: () {
                    Navigator.pushNamed(context, ProductsView.productViewId);
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
