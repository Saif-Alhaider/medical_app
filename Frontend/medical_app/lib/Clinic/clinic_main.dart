import 'package:flutter/material.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../doctor_page/doctor_page.dart';
import '../models/doctors_images.dart';
import '../reuseable_widgets/doctors_cards.dart';

class ClinicMain extends StatelessWidget {
  const ClinicMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: <Widget>[
            
            Container(
                width: double.maxFinite,
                height: 500,
                child: Image.asset(
                  'Assets/clinic/Rectangle546.png',
                  fit: BoxFit.cover,
                )),
            SlidingUpPanel(
              minHeight:420,
              panelBuilder: (sc) {
                return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  controller: sc,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        HeadLineText(text: "عيادة الهدى"),
                        SubText(
                          text: 'تفاصيل',
                          color: Colors.black,
                        ),
                        SubText(
                          text:
                              'تأسست سنة 2012 فيها 4 اطباء فيها اجهزة طبية حديثة',
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                  ),
                  ConstantValues.cardsGap,
                  ConstantValues.cardsGap,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const[
                          Icon(Icons.pin_drop,size: 40,),
                          SubText(
                            text: "بغداد ,الكرادة",
                            color: Colors.blue,
                          )
                        ],
                      ),
                      ConstantValues.cardsGap,
                      Row(
                        children: const[
                          Icon(Icons.watch_later,size: 40,),
                          SubText(
                            text: "12:00PM - 09:00AM",
                            color: Colors.blue,
                          )
                        ],
                      ),
                      ConstantValues.cardsGap,
                      Row(
                        children: const[
                          SubText(
                            text: "سعر الحجز: ",
                            color: Colors.black,
                          ),
                          SubText(
                            text: "30\$",
                            color: Colors.blue,
                          )
                        ],
                      ),
                      
                    ],
                  ),
                  ConstantValues.cardsGap,
                  Breakline(color: Colors.grey,),
                  Container(
                decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 60,
                      spreadRadius: 0.5,
                      color: Color.fromARGB(23, 0, 0, 0))
                ],
                ),
                height: 350,
                child: DoctorsCards(info: doctorsInfo,whereToGo: DoctorPage()),
              )
                ],
                ),
                ),
              );
              },
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child:IconButton(onPressed: (){
                  Navigator.pop(context);
                },icon:  Icon(Icons.arrow_forward_ios,color: Colors.white,)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
