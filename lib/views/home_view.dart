import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_projects/helper/widgets/category_item.dart';
import 'package:flutter_projects/helper/widgets/flashSale_item.dart';
import 'package:flutter_projects/helper/widgets/product_item.dart';
import 'package:flutter_projects/helper/widgets/section_item.dart';
import 'package:flutter_projects/models/catiegory_model.dart';
import 'package:flutter_projects/models/product_model.dart';
import 'package:flutter_projects/services/firebase_firestore.dart';
import 'package:flutter_projects/views/category_view.dart';
import 'package:flutter_projects/views/flash_sale_view.dart';
import 'package:flutter_projects/views/products_view.dart';

import '../utils/app_constants.dart';
import '../helper/widgets/custom_app_bar.dart';

class HomeView extends StatefulWidget {
  static String HomeViewId = AppConstants.kHomeViewId;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categoryList = [];
  List<ProductModel> ProductList = [];
  List<ProductModel> ProductSaleList = [];
  MyFirebaseFirestore myFirebaseFirestore = MyFirebaseFirestore();
  @override
  void initState() {
    super.initState();
    print('init state,');

    getLists();
  }

  void getLists() async {
    print('first get category,');
    categoryList = await myFirebaseFirestore.readCategory();
    ProductList = await myFirebaseFirestore.readProduct();
    ProductSaleList = await myFirebaseFirestore.readProductSale();
    print('second get category,');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Rokaia Store',
            leftIcon: IconButton(
              icon: Icon(Icons.menu_outlined, color: Colors.white),
              onPressed: () {},
            ),
            rightIcon: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),

          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  CustomSearchBar(),
                  SizedBox(height: 20),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CustomCarouselSlider(),
                  ),
                  SizedBox(height: 20),
                  SectionItem(
                    title: 'Categories',
                    subTitle: 'According to your choice',
                    seeMoreButttonOnPressed: () {
                      Navigator.pushNamed(context, CategoryView.categoryViewId);
                    },
                    listOfItems: ListView.builder(
                      itemBuilder: (context, index) => CategoryItem(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductsView.productViewId,
                          );
                        },
                        image: categoryList[index].image,
                        title: categoryList[index].name,
                        imageHeight: 70,
                      ),
                      itemCount: categoryList.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 30),
                  SectionItem(
                    seeMoreButttonOnPressed: () {
                       Navigator.pushNamed(context, FlashSaleView.FlashSaleViewId);
                    },
                    title: 'Flash Sale',
                    subTitle: 'One time offer',
                    //  itemList: categoryList,
                    listOfItems: ListView.builder(
                      itemBuilder: (context, index) => FlashsaleItem(
                        image: ProductSaleList[index].image,
                        title: ProductSaleList[index].name,
                        currentPrice: ProductSaleList[index].currentPrice,
                        prePrice: ProductSaleList[index].prePrice!,
                        onTap: () {
                         //product details
                        },
                      ),
                      itemCount: ProductSaleList.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 30),
                  SectionItem(
                    seeMoreButttonOnPressed: () {},
                    title: 'All Products',
                    subTitle: 'with 100% guarantee',

                    listOfItems: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ProductList.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.95,
                      ),
                      itemBuilder: (context, index) => ProductItem(
                        image: ProductList[index].image,
                        title: ProductList[index].name,
                        currentPrice: ProductList[index].currentPrice,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCarouselSlider extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset(
          'assets/images/slider_images/shawl1.jpg',
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/slider_images/shawl2.jpg',
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/slider_images/shawl3.jpg',
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ],
      options: CarouselOptions(
        viewportFraction: 1,
        height: 150,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      shadowColor: WidgetStatePropertyAll(Colors.transparent),
      side: WidgetStatePropertyAll(BorderSide(color: AppConstants.kAppSeconderyColor, width: 2)),
      backgroundColor: WidgetStatePropertyAll(Colors.white),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.search, color: Colors.grey),
      ),
      hintText: 'Search..',
      hintStyle: WidgetStatePropertyAll(TextStyle(color: Colors.grey)),
      onTap: () {},
    );
  }
}
