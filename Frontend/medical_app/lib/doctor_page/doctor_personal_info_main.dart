import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:medical_app/main_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../reuseable_widgets/star_rating.dart';
import '../reuseable_widgets/texts_types/headline_text.dart';
import '../reuseable_widgets/texts_types/sub_text.dart';

class DoctorPersonalInfoMain extends StatelessWidget {
  const DoctorPersonalInfoMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 105,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg'),
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
                children: const [
                  HeadLineText(
                    text: 'د.محمد علي رضا',
                    color: Colors.black,
                    size: 25,
                    lineHeight: 1,
                  ),
                  SubText(
                    text: 'يعمل في عيادة الهدى',
                  ),
                ],
              ),
              StarRating(
                rate: Rx<int>(4),
                functional: false,
              )
            ],
          ),
          SizedBox(
            width: 50,
            child: IconButton(
              splashColor: MainColors.backgroundGreen,
              color: MainColors.foreignGreen,
              onPressed: () {
                contactDoctor(context);
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

contactDoctor(BuildContext context) async {
  var contactNumber = '7702638672';
  var android_url = 'https://wa.me/$contactNumber?text=مرحبا';
  var ios_url = 'https://wa.me/$contactNumber?text=${Uri.parse("مرحبا")}';

    if(Platform.isIOS){
    // for iOS phone only
    if( await canLaunch(ios_url)){
      await launch(ios_url, forceSafariVC: false);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("whatsapp not installed")));

    }

  }else{
    // android , web
    await launch(android_url);
    


  }

}

