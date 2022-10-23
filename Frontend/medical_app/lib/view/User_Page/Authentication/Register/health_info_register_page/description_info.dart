import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Home/constants.dart';

class DescriptionInfo extends StatelessWidget {
  final TextEditingController controller;
  const DescriptionInfo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.all(8),
              width: double.maxFinite,
              height: 200,
              decoration: BoxDecoration(
                boxShadow: ConstantValues.cardShadow,
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 243, 243, 243)),
              child:  Directionality(
                
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  maxLength: 200,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: "ملاحظات عامة. اجريت عملية, لدي حساسية, اعاني من",
                      counterStyle: GoogleFonts.vazirmatn(color: Colors.blue),
                      contentPadding: const EdgeInsets.all(20),
                      border: InputBorder.none
                    )),
              ),
            );
  }
}
