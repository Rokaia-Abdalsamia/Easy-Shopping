import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/app_constants.dart';

class FlashsaleItem extends StatelessWidget {
   final String image ,title;
   double prePrice;
    double currentPrice;
void Function()? onTap;
 FlashsaleItem({required this.image,required this.title,required this.currentPrice,required this.prePrice,required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return GestureDetector(
    onTap: onTap,
     child: SizedBox(
      width: 100 ,
      // height: 200,
       child: Card(
          clipBehavior: Clip.antiAlias,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)) ,
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
           children: [ Image.network(image,
           width: double.infinity,height: 70,fit: BoxFit.cover,),
     
     
          Padding(
             padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10),
            child: Text(title,style: TextStyle(color:  AppConstants.kAppSeconderyColor,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,fontSize: 11),),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
              Text('$currentPrice',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold)),
              SizedBox(width: 5,),
              Text('$prePrice',style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold,color:  AppConstants.kAppSeconderyColor,fontSize: 10),),
            ],),
          ),
        
           ]
       
       
         ),
       ),
     ),
   );
  }

}