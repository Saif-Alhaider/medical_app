import 'package:flutter/material.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class DoctorCard extends StatelessWidget {
  final String image;
  final String fullName;
  final String speciality;
  const DoctorCard({
    Key? key,
    required this.image,
    required this.fullName,
    required this.speciality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.all(10),
              width: 250,
              decoration: BoxDecoration(
                  color: const Color(0xffFDFDFD),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: ConstantValues.cardShadow
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 150,child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    )),
                    SubText(
                      text: fullName,
                      color: Colors.black,
                    ),
                    SubText(
                      text: speciality,
                      size: 15,
                    )
                  ],
                ),
              ),
            );
  }
}
