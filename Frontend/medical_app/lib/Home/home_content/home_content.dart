import 'package:flutter/material.dart';
import 'package:medical_app/Home/constants.dart';

import 'package:medical_app/Home/home_content/specialities.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  static final List<String> doctorsImages = [
    'doctor-1.png',
    'doctor-2.png',
    'doctor-3.png',
    'doctor-4.png',
    'doctor-5.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Specialities(),
          Column(
            children: [
              Container(
                    
                decoration: BoxDecoration(boxShadow: ConstantValues.cardShadow,),
                height: 350,
                child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 10,itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all( 10),
                    width: 250,
                    decoration: BoxDecoration(
                    color: Color(0xffFDFDFD),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("Assets/images/doctor01.jpeg",fit: BoxFit.cover,),
                          Text("د.محمد الاراكي")
                        ],
                      ),
                    ),
                  );
                },),
              )
            ],
          )
        ],
      ),
    );
  }
}
