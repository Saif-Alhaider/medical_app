

import 'package:flutter/cupertino.dart';
import 'package:medical_app/Home/home_content/specialities/cart_catogary.dart';

import '../../../../models/doctors_catogary/card_catogary_model.dart';

import 'package:get/get.dart';

class Specialities extends StatelessWidget {
  const Specialities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top:Get.width*0.07),
        height: 150,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:listCatogary.length ,
            itemBuilder: (context, index) => CartCatogary(
              myCatogary: listCatogary[index],
            )));
  }
}
