import 'package:flutter/material.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class DoctorLocation extends StatelessWidget {
  const DoctorLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const[
        Icon(Icons.location_on,size: 30,),
        SubText(text: 'برلين,المانيا',color: Colors.blue,),
      ],
    );
  }
}