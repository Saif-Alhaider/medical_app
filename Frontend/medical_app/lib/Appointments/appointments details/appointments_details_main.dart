import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Appointments/appointments%20details/first_card.dart';
import 'package:medical_app/Appointments/appointments%20details/second_card.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class AppointmentDetailsMain extends StatelessWidget {
  const AppointmentDetailsMain({super.key});

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
            children: const [
              FirstCard(),
              ConstantValues.cardsGap,
              ConstantValues.cardsGap,
              ConstantValues.cardsGap,
              SecondCard(),
            ],
          ),
        ),
      ),
    );
  }
}
