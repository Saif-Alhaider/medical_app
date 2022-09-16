import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medical_app/health_info/widgets/drop_down.dart';
import 'package:medical_app/health_info/widgets/inc_dec_container.dart';
import 'package:medical_app/health_info/widgets/male_female_container.dart';
import 'package:medical_app/health_info/widgets/my_button2.dart';

import '../Home/widgets/my_text-field.dart';

class HelthInfo extends StatefulWidget {
  const HelthInfo({Key? key}) : super(key: key);

  @override
  State<HelthInfo> createState() => _HelthInfoState();
}

class _HelthInfoState extends State<HelthInfo> {
  String radioItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(child: Image.asset("Assets/images/health-checkup.png")),
                    const Text(
                      "المعلومات الصحية",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    MaleFemale(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncDecContainer(
                          Text: 'الطول',
                          Myheight: 175,
                          Text2: 'cm',
                        ),
                        IncDecContainer(
                          Text: 'الوزن',
                          Myheight: 75,
                          Text2: 'kg',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyDropdownButton(),
                        IncDecContainer(
                          Text: 'العمر',
                          Myheight: 19,
                          Text2: '',
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 56.0),
                      child: MyTextField(
                        maxLength: 255,
                        hint: 'ملاحظات',
                        maxLines: 5,
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton2(
                      borderRadius: 25,
                      text: 'تخطي',
                      Myontap: () {},
                      bgColor: Color(0xffCBE2F4),
                      texColol: Color(0xff2196f3),
                    ),
                    MyButton2(
                      borderRadius: 25,
                      text: 'التالي',
                      Myontap: () {},
                      bgColor: Color(0xff2196f3),
                      texColol: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
