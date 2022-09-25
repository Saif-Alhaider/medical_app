import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:medical_app/main_colors.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/reuseable_widgets/waiting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorPatientsAppointmentsMain extends StatelessWidget {
  const DoctorPatientsAppointmentsMain({super.key});

  @override
  Widget build(BuildContext context) {
    getDoctorPatients();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xfff6f6f6),
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: FutureBuilder(
              future: getDoctorPatients(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Waiting();
                  case ConnectionState.done:
                  default:
                    if (snapshot.hasError) {
                      return Text("something went wrong");
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: ListTileTheme(
                                tileColor: MainColors.backgroundGreen,
                                child: ListTile(
                                  title: Text(
                                    snapshot.data[index]['patient name'],
                                    style: GoogleFonts.vazirmatn(fontSize: 30),
                                  ),
                                  subtitle: Text(
                                    snapshot.data[index]['date'],
                                    style: GoogleFonts.vazirmatn(fontSize: 18),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios),
                                  ),
                                )),
                          );
                        },
                      );
                    } else {
                      return Text("there is no data");
                    }
                }
              },
            )),
      )),
    );
  }
}

Future? getDoctorPatients() async {
  const String url =
      "http://10.0.2.2:8000/api/doctor/doctor_patients_appointments";
  var prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  var response = await http.get(Uri.parse(url), headers: {
    "Content-Type": "application/json",
    'Authorization': 'Bearer $token',
  });
  var result = jsonDecode(response.body);
  result = result
      .map((e) => {
            'patient name': e['patient name'],
            'date': DateFormat('yyyy-MM-dd, EEEE, hh:mm')
                .format(DateTime.parse(e['date']))
          })
      .toList();
  return result;
}
