import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/User_Page/loged_user_page/Appointments/appointment_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../reuseable_widgets/waiting.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({super.key});
  static const double pagePadding = 16;

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab>
    with TickerProviderStateMixin {
  late Future<Map> dataFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataFuture = getAppointments();
  }

  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xfff6f6f6),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[60],
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: FutureBuilder(
            future: dataFuture,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Waiting();
                case ConnectionState.done:
                default:
                  if (snapshot.hasError) {
                    return Center(
                        child: ElevatedButton(
                      child: Text("حدثت مشكلة اضغط لاعادة التحميل "),
                      onPressed: () {
                        setState(() {});
                      },
                    ));
                  } else if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          padding: const EdgeInsets.symmetric(
                              horizontal: ScheduleTab.pagePadding / 2),
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: ScheduleTab.pagePadding / 2),
                          isScrollable: true,
                          labelColor: Colors.black,
                          labelStyle: GoogleFonts.vazirmatn(fontSize: 20),
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorWeight: 4,
                          tabs: const [
                            Tab(text: 'المواعيد القادمة'),
                            Tab(text: 'المواعيد السابقة'),
                          ],
                        ),
                        Expanded(
                          child:
                              TabBarView(controller: _tabController, children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!['appointments'].length,
                              itemBuilder: (context, index) {
                                return AppointmentCard(
                                  doctorName: snapshot.data!['appointments']
                                      [index]['doctor'],
                                  doctorImage: snapshot.data!['appointments']
                                      [index]['doctor image'],
                                  speciality: snapshot.data!['appointments']
                                      [index]['speciality'],
                                  date: snapshot.data!['appointments'][index]
                                      ['date'],
                                      clinic: snapshot.data!['appointments'][index]['clinic'],
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!['appointments'].length,
                              itemBuilder: (context, index) {
                                return AppointmentCard(
                                  doctorName: snapshot.data!['appointments']
                                      [index]['doctor'],
                                  doctorImage: snapshot.data!['appointments']
                                      [index]['doctor image'],
                                  speciality: snapshot.data!['appointments']
                                      [index]['speciality'],
                                  date: snapshot.data!['appointments'][index]
                                      ['date'],
                                      clinic: snapshot.data!['appointments'][index]['clinic'],
                                );
                              },
                            )
                          ]),
                        )
                      ],
                    );
                  } else {
                    return Text('no data');
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<Map> getAppointments() async {
  var prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  const String url = 'http://10.0.2.2:8000/api/appointment/appointments';
  var response = await http.get(
    Uri.parse(url),
    headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    },
  );
  final body = jsonDecode(response.body);
  return body;
}

// http://localhost:8000/api/appointment/appointments