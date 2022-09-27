import 'package:flutter/material.dart';

import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class DoctorLocation extends StatelessWidget {
  final String location;
  const DoctorLocation({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on,size: 30,),
        SubText(text: location,color: Colors.blue,),
      ],
    );
  }
}
