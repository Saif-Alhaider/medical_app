import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/date_picker_timeline-1.2.3/date_picker_timeline.dart';
import 'package:medical_app/reuseable_widgets/main_button.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';

import '../models/doctor_appointments/appointments.dart';
import '../reuseable_widgets/break_line.dart';
import 'convert_utc_time_to_active_dates.dart';

class DoctorSchedual extends StatelessWidget {
  final List active_dates;
  final int? doctor_id;
  DoctorSchedual({
    Key? key,
    required this.active_dates,
    required this.doctor_id,
  }) : super(key: key);

  TimeOfDay? time;
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    DateTime? sentDate;
    Map<DateTime, List<TimeOfDay>> active_dates2 =
        convert_to_active_dates(activeDates: active_dates);
    // DateTime selectedDate = active_dates2.keys.first;
    DateTime? selectedDate;
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadLineText(
              text: 'جدول المواعيد',
              size: 24,
              color: Colors.black,
            ),
            DatePicker(
              daysCount: 30,
              width: 80,
              height: 110,
              DateTime.now(),
              initialSelectedDate: null, //selectedDate
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              activeDates: active_dates2.keys.toList(),
              dateTextStyle: GoogleFonts.vazirmatn(fontSize: 18),
              monthTextStyle: GoogleFonts.vazirmatn(fontSize: 18),
              dayTextStyle: GoogleFonts.vazirmatn(fontSize: 18),
              deactivatedColor: Colors.grey,

              onDateChange: (date) {
                setState(() {
                  selectedDate = date;
                  // print(selectedDate);
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Breakline(
                  color: Color.fromARGB(255, 208, 208, 208), height: 2),
            ),
            selectedDate != null
                ? Center(
                    child: SizedBox(
                      height: 200,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (1 / .5),
                          crossAxisCount: 3,
                        ),
                        itemCount: active_dates2[selectedDate]!
                            .length, //timeSchedual[selectedDate]!.length
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                sentDate = DateTime(
                                    selectedDate!.year,
                                    selectedDate!.month,
                                    selectedDate!.day,
                                    active_dates2[selectedDate]![index].hour,
                                    active_dates2[selectedDate]![index].minute);

                                // time = active_dates2[selectedDate]![index];
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text(
                                    active_dates2[selectedDate]![index]
                                        .format(context),
                                    style: GoogleFonts.vazirmatn(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : SizedBox(),
            StatefulBuilder(
              builder: (BuildContext context, setState) {
                setState(() {});
                return sentDate != null
                    ? MainButton(
                        onPressed: ()async {
                          sendDate(date: sentDate!.toUtc(),doctor_id: doctor_id!);
                        },
                        buttonTitle: "احجز")
                    : SizedBox();
              },
            ),
            ConstantValues.cardsGap
          ],
        );
      },
    );
  }
}

Future sendDate({required DateTime date,required int doctor_id}) async {
  final url = "http://10.0.2.2:8000/api/appointment/create_appointment";
  var prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  var response = await http.post(Uri.parse(url),
  headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "date":date,
          "doctor_id":doctor_id
        })
        );
}
