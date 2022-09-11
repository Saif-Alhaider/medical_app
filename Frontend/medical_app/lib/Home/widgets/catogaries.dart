

import 'package:flutter/cupertino.dart';

import '../../models/home_page/card_catogary_model.dart';
import 'cards/cart_catogary.dart';

class Catocaries extends StatelessWidget {
  const Catocaries({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 112,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:listCatogary.length ,
            itemBuilder: (context, index) => Cart_Catogary(
              myCatogary: listCatogary[index],
            )));
  }
}
