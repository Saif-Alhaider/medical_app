
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

bool IsMale=true;
class MaleFemale extends StatelessWidget {
  const MaleFemale({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaleFemaleCard(bgColor: Color(0xffEF4FD5), img: 'Assets/images/female.svg', text: "انثى",  isMale: !IsMale,),
        MaleFemaleCard(bgColor: Color(0xff2196f3), img: 'Assets/images/male.svg', text: "ذكر", isMale: IsMale,),
      ],
    );
  }
}

class MaleFemaleCard extends StatelessWidget {
  MaleFemaleCard({
    Key? key,
    required this.bgColor,
    required this.img,
    required this.text,

    required bool isMale,

  }) :LocalIsMale=isMale.obs, super(key: key);
  Color bgColor;
  String img;
  String text;
 RxBool LocalIsMale;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      width: Get.width * 0.42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(img),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            Obx(() =>   InkWell(
                  onTap: (){
                    if (LocalIsMale.value) {
                     // LocalIsMale.value=false;
                      LocalIsMale.value=false;
                    } else{
                     // LocalIsMale.value=true;
                      LocalIsMale.value=true;
                    }
                    print(LocalIsMale.value);
                  },
                  child:
                  LocalIsMale.value?SvgPicture.asset("Assets/icons/Done.svg"):SvgPicture.asset("Assets/icons/Undone.svg"))),
            ],
          ),
        ],
      ),
    );
  }
}
