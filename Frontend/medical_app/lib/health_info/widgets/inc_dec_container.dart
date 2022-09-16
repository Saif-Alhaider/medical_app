
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'my_button.dart';

class IncDecContainer extends StatefulWidget {
  IncDecContainer({
    Key? key,
    required int Myheight,
    required this.Text,
    required this.Text2,

  }) :num=(Myheight??0).obs ;

  String Text;
  String Text2;
  RxInt num;

  @override
  State<IncDecContainer> createState() => _IncDecContainerState();
}

class _IncDecContainerState extends State<IncDecContainer> {
  var MediaQueOfButton = Get.width*0.1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(vertical: 16),
      width: Get.width*0.42,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffFDFDFD),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.Text}",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child:Obx(() =>  Text(
              "${widget.num.value} ${widget.Text2}",
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(height: MediaQueOfButton, width: MediaQueOfButton, text: '-', Myontap: (){widget.num.value--;}, borderRadius: 50,),
              MyButton(height: MediaQueOfButton, width: MediaQueOfButton, text: '+', Myontap: (){widget.num.value++;}, borderRadius: 50,),

            ],
          ),

        ],
      ),
    );
  }
}
