import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:medical_app/main_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../reuseable_widgets/star_rate.dart';
import '../reuseable_widgets/star_rating.dart';
import '../reuseable_widgets/texts_types/headline_text.dart';
import '../reuseable_widgets/texts_types/sub_text.dart';

class DoctorPersonalInfoMain extends StatelessWidget {
  String img;
  String name;
  String doctor_number;
  // int rate;

  DoctorPersonalInfoMain({
    Key? key,
    required this.img,
    required this.name,
    required this.doctor_number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width*0.26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(img).image,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  HeadLineText(
                    text: "$name",
                    color: IsDark? MainDarkColors.primaryFontColor:MainLiteColors.primaryFontColor,
                    size: 25,
                    lineHeight: 1,
                  ),
                  const SubText(
                    text: 'يعمل في عيادة الهدى',
                  ),
                ],
              ),
              // StartRate(rate: rate, size: 24,),
            ],
          ),
          SizedBox(
            width: 50,
            child: IconButton(
              splashColor: MainLiteColors.backgroundGreen,
              color: MainLiteColors.foreignGreen,
              onPressed: () {
                contactDoctor(context:context,phone_number:doctor_number);
              },
              padding: EdgeInsets.zero,
              icon: const Icon(
                FontAwesome5.whatsapp,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

contactDoctor({required BuildContext context,required String phone_number}) async {
  var contactNumber = phone_number;
  var android_url = 'https://wa.me/$contactNumber?text=مرحبا';
  var ios_url = 'https://wa.me/$contactNumber?text=${Uri.parse("مرحبا")}';

  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunch(ios_url)) {
      await launch(ios_url, forceSafariVC: false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("whatsapp not installed")));
    }
  } else {
    // android , web
    await launch(android_url);
  }
}
