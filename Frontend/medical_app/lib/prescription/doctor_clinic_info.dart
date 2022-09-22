import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reuseable_widgets/texts_types/sub_text.dart';

class DoctorClinicInfo extends StatelessWidget {
  const DoctorClinicInfo({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SubText(text: "العيادة"),
                                SubText(
                                  text: " ماء الحياة",
                                  color: Colors.black,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  const [
                                SubText(text: "الدكتور"),
                                SubText(
                                  text: "محمد الموسوي",
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ],
                        );
  }
}