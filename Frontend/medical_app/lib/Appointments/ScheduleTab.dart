import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Appointments/appointment_card.dart';
import 'package:medical_app/doctor_page/doctor_page.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

import 'appointments details/appointments_details_main.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({super.key});
  static const double pagePadding = 16;

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: Colors.grey[60],
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
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
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AppointmentDetailsMain(),
                                ));
                          },
                          child: const AppointmentCard());
                    },
                  ),
                  const Text("second")
                ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
