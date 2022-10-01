import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'package:medical_app/User_Page/loged_user_page/Appointments/ScheduleTab.dart';
import 'package:medical_app/User_Page/loged_user_page/doctor_patients_appointment/doctor_patients_appointments_main.dart';
import 'package:medical_app/User_Page/loged_user_page/profile%20details/single_detail.dart';
import 'package:medical_app/User_Page/user%20settings/user_health_info.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

import '../../../main_colors.dart';
import '../../Notifications/notifications.dart';
import '../../user settings/user_account_info.dart';

class ProfileDetails extends StatelessWidget {
  final String? role;
  const ProfileDetails({
    Key? key,
    this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.maxFinite,
      // height: 380,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                blurRadius: 40,
                color: Color.fromARGB(40, 0, 0, 0),
                offset: Offset(0, 8))
          ]),
      child: Column(
        children:  [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications(),));
            },
            child: const SinglDetail(
              backgroundIconColor: MainColors.backgroundYellow,
              icon: Icons.notifications_active_outlined,
              iconColor: MainColors.foreignYellow,
              title: "الاشعارات",
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserHealthInfo(),));
            },
            child: const SinglDetail(
              backgroundIconColor: MainColors.backgroundGreen,
              icon: FontAwesome5.stethoscope,
              iconColor: MainColors.foreignGreen,title: "المعلومات الصحية",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserAccountInfo(),));
            },
            child: const SinglDetail(
              backgroundIconColor: MainColors.backgroundBlue,
              icon: Icons.person,
              iconColor: Colors.blue,
              title: "الحساب",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleTab(),));
            },
            child: const SinglDetail(
              break_line: true,
              backgroundIconColor: MainColors.backgroundBlue,
              icon: FontAwesome5.calendar_alt,
              iconColor: MainColors.foreignBlue,
              title: "المواعيد",
            ),
          ),
          if (role == "DO") GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorPatientsAppointmentsMain(),)),
            child: const SinglDetail(
                        backgroundIconColor: MainColors.backgroundRed,
                        icon: Icons.people,
                        iconColor: MainColors.foreignRed,
                        title: "المراجعين",
                        break_line: false),
          ) else Container()
          ,
        ],
      ),
    );
  }
}
