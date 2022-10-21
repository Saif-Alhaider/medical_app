import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:medical_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../reuseable_widgets/texts_types/headline_text.dart';
import 'appointments details/appointments_details_main.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String doctorImage;
  final String speciality;
  final String date;
  final String clinic;
  const AppointmentCard({
    Key? key,
    required this.doctorName,
    required this.doctorImage,
    required this.speciality,
    required this.date,
    required this.clinic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatedDate =
        DateFormat('E, M LLL').format(DateTime.parse(date).toLocal());
    var formatedTime =
        TimeOfDay.fromDateTime(DateTime.parse(date).toLocal()).format(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                blurRadius: 40,
                color: Color.fromARGB(40, 0, 0, 0),
                offset: Offset(0, 8))
          ],
          borderRadius: BorderRadius.circular(10)),
      width: 100,
      height: 280,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  '${siteUrl}images/' + doctorImage,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeadLineText(
                    text: doctorName,
                    color: Colors.black,
                    lineHeight: 1,
                    size: 22,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  HeadLineText(
                    text: speciality,
                    color: Color(0xffc4c4c4),
                    lineHeight: 1,
                    size: 15,
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: double.maxFinite,
              height: 70,
              decoration: BoxDecoration(
                  color: const Color(0xffF9F8FD),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.date_range_rounded),
                        Text(
                          formatedDate,
                          style: GoogleFonts.vazirmatn(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              height: 2),
                        )
                      ],
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        children: [
                          Text(formatedTime,
                              style: GoogleFonts.vazirmatn(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  height: 2)),
                          const Icon(Icons.watch_later_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () => null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                              side: const BorderSide(color: Color(0xffc4c4c4))),
                        ),
                      ),
                      child: Text(
                        "الغاء الحجز",
                        style: GoogleFonts.vazirmatn(
                            fontSize: 18, color: const Color(0xffc4c4c4)),
                      )),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppointmentDetailsMain(
                              date: date,
                              doctorName: doctorName,
                              image: doctorImage,
                              clinic: clinic,
                              doctorSpeciality: speciality,
                            ),
                          )),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff47CEFF)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                      child: Text(
                        "معلومات الحجز",
                        style: GoogleFonts.vazirmatn(fontSize: 18),
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
