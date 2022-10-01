import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' hide TextDirection;

import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/User_Page/loged_user_page/Appointments/appointments%20details/first_card.dart';
import 'package:medical_app/User_Page/loged_user_page/Appointments/appointments%20details/receipt_section.dart';
import 'package:medical_app/User_Page/loged_user_page/Appointments/appointments%20details/second_card.dart';
import 'package:medical_app/models/doctors_images.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class AppointmentDetailsMain extends StatelessWidget {
  final String doctorName;
  final String clinic;
  final String date;
  final String image;
  final String doctorSpeciality;
  const AppointmentDetailsMain({
    Key? key,
    required this.doctorName,
    required this.clinic,
    required this.date,
    required this.image,
    required this.doctorSpeciality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
        
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff6f6f6),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children:  [
              FirstCard(clinic: clinic,date: date,doctorName: doctorName,doctorSpeciality: doctorSpeciality,doctorImage: image),
              for(var i=0;i<3;i++) ConstantValues.cardsGap,
              const SecondCard(),
              for(var i=0;i<3;i++) ConstantValues.cardsGap,
              const ReceiptSection()
            ],
          ),
        ),
      ),
    );
  }
}
