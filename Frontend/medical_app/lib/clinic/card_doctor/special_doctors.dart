import 'package:flutter/cupertino.dart';

import '../../models/doctor_appointments/card_doctor_model.dart';
import 'card_of_special_doctor.dart';


class SpecialDoctors extends StatelessWidget {
  const SpecialDoctors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width*0.36,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:DoctorsList.length ,
            itemBuilder: (context, index) => CardOfSpecialDoctor(
              doctor: DoctorsList[index],
            )));
  }
}