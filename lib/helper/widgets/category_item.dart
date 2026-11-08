import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/app_constants.dart';
class CategoryItem extends StatelessWidget{
 final String image ,title;
 final double imageHeight;
 void Function()? onTap;
 CategoryItem({required this.image,required this.title,required this.imageHeight,required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return GestureDetector(
    onTap: onTap,
     child: SizedBox(
      width: 100 ,
      height: 120,
       child: Card(
          clipBehavior: Clip.antiAlias,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)) ,
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
           children: [ Image.network(image,
           width: double.infinity,height: imageHeight,fit: BoxFit.cover,),
     
     Spacer(),
          Text(title,style: TextStyle(color: AppConstants.kAppSeconderyColor),),
          Spacer(),
           ]
       
       
         ),
       ),
     ),
   );
  }

}
//'https://picsum.photos/100'