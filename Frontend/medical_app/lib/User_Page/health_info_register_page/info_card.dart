import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Home/constants.dart';

import '../../reuseable_widgets/texts_types/sub_text.dart';

class InfoCard extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String unit;
  const InfoCard({
    Key? key,
    required this.controller,
    required this.title,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;
    return Container(
      // width: 185,
      height: 180,
      decoration: BoxDecoration(
          color: Color(0xffFDFDFD),
          borderRadius: BorderRadius.circular(12),
          boxShadow: ConstantValues.cardShadow,),
      child: Column(
        children: [
          SubText(
            text: title,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 90,
            child: TextField(
              textAlign: TextAlign.center,
              controller: controller,
              keyboardType: TextInputType.number,
              maxLength: 3,
              style: GoogleFonts.vazirmatn(fontSize: 28),
              decoration: InputDecoration(
                counterText: "",
                suffix: SubText(
                  text: unit,
                  color: Colors.black,
                  size: 28,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => controller.text =
                    (int.parse(controller.text) - 1).toString(),
                onTapDown: (TapDownDetails tapDownDetails) {
                  timer = Timer.periodic(
                    const Duration(milliseconds: 200),
                    (timer) {
                      controller.text =
                          (int.parse(controller.text) - 1).toString();
                    },
                  );
                },
                onTapUp: (details) {
                  timer != null ? timer!.cancel() : null;
                },
                onTapCancel: () {
                  timer != null ? timer!.cancel() : null;
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Color.fromARGB(59, 0, 0, 0),
                            offset: Offset(0, 8))
                      ]),
                  child: const Icon(FontAwesome5.minus),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => controller.text =
                    (int.parse(controller.text) + 1).toString(),
                onTapDown: (TapDownDetails tapDownDetails) {
                  timer = Timer.periodic(
                    const Duration(milliseconds: 200),
                    (timer) {
                      controller.text =
                          (int.parse(controller.text) + 1).toString();
                    },
                  );
                },
                onTapUp: (details) {
                  timer != null ? timer!.cancel() : null;
                },
                onTapCancel: () {
                  timer != null ? timer!.cancel() : null;
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Color.fromARGB(59, 0, 0, 0),
                            offset: Offset(0, 8))
                      ]),
                  child: const Icon(FontAwesome5.plus),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
