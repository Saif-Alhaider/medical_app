import 'package:flutter/material.dart';
import 'package:medical_app/doctor_page/doctor_page.dart';
import 'package:medical_app/models/doctor/doctorModel.dart';

import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

import '../models/home_card_info.dart';



class HomeCard extends StatelessWidget {
  final List<HomeCardInfo>? info;
  
  const HomeCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: info!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorPage(doctor_id: info![index].id),
                )),
            child: Container(
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
                        child: Image.network(
                          info![index].image,
                          fit: BoxFit.cover,
                        )),
                    SubText(
                      text: info![index].title,
                      color: Colors.black,
                    ),
                    SubText(
                      text: info![index].subTitle,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
