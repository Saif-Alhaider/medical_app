import 'package:flutter/material.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadLineText(text: 'التخصص',color: Colors.black,size: 25,),
        Container(width: 120,
        height: 45,
          decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
          child: Center(child: SubText(text: 'جلدية',color: Colors.white,)),
        )
      ],
    );
  }
}