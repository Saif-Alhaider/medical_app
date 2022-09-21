import 'package:flutter/material.dart';

import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

import '../doctor_page/doctor_page.dart';
import '../models/doctors_images.dart';

class DoctorsCards extends StatelessWidget {
  final List <Map> info;
  final Widget whereToGo;
  const DoctorsCards({
    Key? key,
    required this.info,
    required this.whereToGo,
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
        scrollDirection: Axis.horizontal,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => whereToGo,
                )),
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 250,
              decoration: BoxDecoration(
                  color:  Color(0xffFDFDFD),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          info[index]['image'],
                          fit: BoxFit.cover,
                        )),
                     SubText(
                      text: info[index]['name'],
                      color: Colors.black,
                    ),
                     SubText(
                      text: info[index]['details'],
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
