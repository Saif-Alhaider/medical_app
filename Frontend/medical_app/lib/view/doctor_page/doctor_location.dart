import 'package:flutter/material.dart';

import 'package:medical_app/view/reuseable_widgets/texts_types/sub_text.dart';

import '../../main.dart';
import '../theme/main_colors.dart';

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
        Icon(
          Icons.location_on,
          size: 30,
          color: IsDark
              ? MainDarkColors.primaryFontColor
              : MainLiteColors.primaryFontColor,
        ),
        SubText(
          text: location,
          color: Colors.blue,
        ),
      ],
    );
  }
}
