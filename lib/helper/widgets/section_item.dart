import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:flutter_projects/helper/widgets/category_item.dart';
import 'package:flutter_projects/helper/widgets/flashSale_item.dart';
import 'package:flutter_projects/helper/widgets/product_item.dart';
import 'package:flutter_projects/models/catiegory_model.dart';

class SectionItem extends StatelessWidget {
  final String title, subTitle;
  //Function onPressed;
   Widget listOfItems;
 // List<CategoryModel> itemList;
void Function()? seeMoreButttonOnPressed;
  Color colorOfSubTitle;
  SectionItem({
    required this.title,
    required this.subTitle,
    required this.listOfItems,
required this.seeMoreButttonOnPressed,
    // required this.itemTitle,
    // required this.itemImage,
    this.colorOfSubTitle = Colors.grey,
   // required this.itemList,
  });
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(subTitle, style: TextStyle(color: colorOfSubTitle)),
              ],
            ),
            ElevatedButton(
              onPressed: seeMoreButttonOnPressed,
              child: Text('See More >', style: TextStyle(color:  AppConstants.kAppSeconderyColor)),
            ),
          ],
        ),
        
        SizedBox( //height: 130,
          height: title=='All Products'?  null :130,
          child: listOfItems,),

      ],
    );
  }
}
