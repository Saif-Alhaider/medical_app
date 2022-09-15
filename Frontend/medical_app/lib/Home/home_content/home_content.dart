import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Home/constants.dart';

import 'package:medical_app/Home/home_content/specialities.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';
import 'package:medical_app/models/doctors_images.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Specialities(),
          Column(
            children: [
              ConstantValues.cardsGap,
              ConstantValues.cardsGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  HeadLineText(
                    text: "الاطباء",
                    lineHeight: 1,
                  ),
                  SubText(text: "المزيد")
                ],
              ),
              ConstantValues.cardsGap,
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 60,
                        spreadRadius: 0.5,
                        color: Color.fromARGB(23, 0, 0, 0))
                  ],
                ),
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: 250,
                      decoration: BoxDecoration(
                          color: const Color(0xffFDFDFD),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 200,
                                child: Image.asset(
                                  doctorsImages[index],
                                  fit: BoxFit.cover,
                                )),
                            const SubText(
                              text: "د.محمد الاراكي",
                              color: Colors.black,
                            ),
                            const SubText(
                              text: "اخصائي جراحة قلب",
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
