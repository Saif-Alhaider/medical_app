
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Home/widgets/star_rate.dart';

import '../../../models/home_page/card_clinc_model.dart';

class CardOfClinc extends StatelessWidget {
  ClincCardMol clinc;
  CardOfClinc({
    required this.clinc,
    Key? key,
  }) : super(key: key);
  final Color primaryTextColor = Colors.black;
  final Color seconderyTextColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.only(bottom: 8),
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('Assets/images/clincs/clinc1.png'),
            Text(
              "عيادة الهدى",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "فحوصات شاملة",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "35% خصم",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff2196F3),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      InkWell(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff2196F3),
                          ),
                          child: Text(
                            "احجز الان",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "ذي قار, صلاح الدين",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: seconderyTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const StartRate(
                        rate: 4, size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
