import 'package:flutter/material.dart';

class Specialties extends StatelessWidget {
  const Specialties({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end,
      children:  [
      Stack(alignment: Alignment.center,
        children: [Container(
          width: 75,
          height: 20,
          decoration: BoxDecoration(
            color:Colors.blue,
            borderRadius: BorderRadius.circular(5)
          ),
        ),
        Text('باطنيه',style: TextStyle(color:Colors.white,fontSize: 12))
      ]),
      SizedBox(width: 5,),
      Stack(alignment: Alignment.center,
        children: [Container(
          width: 75,
          height: 20,
          decoration: BoxDecoration(
            color:Colors.blue,
            borderRadius: BorderRadius.circular(5)
          ),
        ),
        Text('اسنان',style: TextStyle(color:Colors.white,fontSize: 12))
      ]),
      SizedBox(width: 5,),
      Stack(alignment: Alignment.center,
        children: [Container(
          width: 75,
          height: 20,
          decoration: BoxDecoration(
            color:Colors.blue,
            borderRadius: BorderRadius.circular(5)
          ),
        ),
        const Text('قلبيه',style: TextStyle(color:Colors.white,fontSize: 12))
      ])
    ],);
  }
}