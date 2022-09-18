import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/doctor_appointments/card_doctor_model.dart';





class CardOfSpecialDoctor extends StatelessWidget {
  DoctorCardMol doctor;

  CardOfSpecialDoctor({
    required this.doctor,
    Key? key,
  }) : super(key: key);

  final Color primaryTextColor = Colors.black;
  final Color seconderyTextColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(left: 8),
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.star,
                  color: Color(0xffFFD700),
                  size: 14,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${doctor.rate}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 32.0,
              backgroundImage: Image.asset(
                doctor.img,
              ).image,
              backgroundColor: Colors.transparent,
            ),
            Text(
              doctor.name,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              doctor.specialty,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: seconderyTextColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
