import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/Home/constants.dart';

import 'package:medical_app/User_Page/loged_user_page/Appointments/ScheduleTab.dart';
import 'package:medical_app/User_Page/loged_user_page/doctor_patients_appointment/doctor_patients_appointments_main.dart';
import 'package:medical_app/User_Page/loged_user_page/profile%20details/single_detail.dart';
import 'package:medical_app/User_Page/loged_user_page/user%20settings/user_health_info.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

import '../../../main.dart';
import '../../../main_colors.dart';
import '../../Notifications/notifications.dart';
import '../user settings/user_account_info.dart';
import 'package:get/get.dart';

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
          color: IsDark ? MainDarkColors.bgColor : MainLiteColors.bgColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                blurRadius: 40,
                color: Color.fromARGB(40, 0, 0, 0),
                offset: Offset(0, 8))
          ]),
      child: Column(
        children: [
          SinglDetail(
            backgroundIconColor: MainLiteColors.backgroundYellow,
            icon: Icons.notifications_active_outlined,
            iconColor: MainLiteColors.foreignYellow,
            title: "الاشعارات",
            whereToGo: () {
             Get.to(Notifications());
            },
          ),
          SinglDetail(
            backgroundIconColor: MainLiteColors.backgroundGreen,
            icon: FontAwesome5.stethoscope,
            iconColor: MainLiteColors.foreignGreen,
            title: "المعلومات الصحية",
            whereToGo: () {
             Get.to(UserHealthInfo());
            },
          ),
          SinglDetail(
            backgroundIconColor: MainLiteColors.backgroundBlue,
            icon: Icons.person,
            iconColor: Colors.blue,
            title: "الحساب",
            whereToGo: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserAccountInfo(),
                  ));
            },
          ),
          SinglDetail(
            break_line: true,
            backgroundIconColor: MainLiteColors.backgroundBlue,
            icon: FontAwesome5.calendar_alt,
            iconColor: MainLiteColors.foreignBlue,
            title: "المواعيد",
            whereToGo: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScheduleTab(),
                  ));
            },
          ),
          if (role == "DO")
            SinglDetail(
              backgroundIconColor: MainLiteColors.backgroundRed,
              icon: Icons.people,
              iconColor: MainLiteColors.foreignRed,
              title: "المراجعين",
              break_line: false,
              whereToGo: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DoctorPatientsAppointmentsMain(),
                    ));
              },
            )
          else
            Container(),
        ],
      ),
    );
  }
}
