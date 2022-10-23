import 'package:flutter/material.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/sub_text.dart';

import '../../main.dart';
import '../../main_colors.dart';

class DoctorSpeciality extends StatelessWidget {
  String Speciality;

  DoctorSpeciality({
    required this.Speciality,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadLineText(
          text: 'التخصص',
          color: IsDark
              ? MainDarkColors.primaryFontColor
              : MainLiteColors.primaryFontColor,
          size: 25,
        ),
        Container(
          width: 120,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: SubText(
            text: Speciality,
            color: Colors.white,
          )),
        )
      ],
    );
  }
}
