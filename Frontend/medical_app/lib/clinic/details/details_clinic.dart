import 'package:flutter/material.dart';

class details extends StatelessWidget {
  const details({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text('تفاصيل',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),

         const Text('تأسست سنة 2012 فيها 4 اطباء فيها اجهزة طبية حديثة '),
         Row(mainAxisAlignment: MainAxisAlignment.end,
          children: const [
           Text('بغداد-الكراده',style: TextStyle(color:Colors.blue)),
          SizedBox(width: 5,),
         Icon(Icons.location_on,color:Colors.black)
         ],),
         const SizedBox(height: 16,),
         Row(mainAxisAlignment: MainAxisAlignment.end,
          children: const [
           Text('12:00PM-9:00AM',style: TextStyle(color:Colors.blue)),
          SizedBox(width: 5,),
         Icon(Icons.watch_rounded,color:Colors.black)
         ],),
         const SizedBox(height: 16,width: 8,),
      Row(mainAxisAlignment: MainAxisAlignment.end,
          children: const [
           Text('30\$',style: TextStyle(color:Colors.blue)),
          SizedBox(width: 8,),
         Text(':سعر الحجز',style: TextStyle(color:Colors.black)),
         ],),
         const SizedBox(height: 16,),
         Container(
          width: 350,
          height: 1,
          color:Colors.black
         ),
         const SizedBox(height: 16,),
          const Text('التخصصات',style: TextStyle(color:Colors.black,fontSize: 20)),
          

         
      ],
    );
  }
}
