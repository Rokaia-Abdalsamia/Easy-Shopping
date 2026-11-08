import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/app_constants.dart';

class ProductItem extends StatelessWidget {
   final String image ,title;
  //   double? prePrice;
    double currentPrice;
 ProductItem({required this.image,required this.title,required,required this.currentPrice});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return SizedBox(
    width: 220 ,
    //  height: 250,
     child: Card(
        clipBehavior: Clip.antiAlias,
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)) ,
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        
         children: [ Image.network(image,
         width: double.infinity,height: 150,fit: BoxFit.cover,),


        Padding(
           padding: const EdgeInsets.only(left: 8.0,right: 8,top: 15),
          child: Text(title,style: TextStyle(overflow: TextOverflow.ellipsis,),),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8,bottom:20),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween
            ,
            children: [
            Text('Rs.2200',style: TextStyle(fontWeight: FontWeight.bold)),
            CircleAvatar(
              radius: 17,
              backgroundColor:  AppConstants.kAppSeconderyColor,
              child: Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_outlined,color: Colors.white,),
            padding: EdgeInsets.zero,  ),
              ))
           ],),
        ),
      
         ]
     
     
       ),
     ),
   );
  }

}