import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../reuseable_widgets/texts_types/headline_text.dart';

class WelcomeSection extends StatefulWidget {
  const WelcomeSection({super.key});

  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection> {
  String? full_name;
  Future<String> get_fullName() async {
    var prefs = await SharedPreferences.getInstance();
    full_name = prefs.getString('fullName');
    return full_name!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadLineText(
              text: "مرحبا",
              lineHeight: 1,
              size: 28,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            HeadLineText(
              text: 'ابحث عن طبيب او عيادة',
              lineHeight: 2,
              size: 24,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ],
        ),
        const CircleAvatar(
          backgroundImage:
              NetworkImage('https://api.lorem.space/image/face?w=150&h=150'),
          radius: 40,
        )
      ],
    );
  }
}
