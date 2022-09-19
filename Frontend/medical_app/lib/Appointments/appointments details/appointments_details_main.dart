import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class AppointmentDetailsMain extends StatelessWidget {
  const AppointmentDetailsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff6f6f6),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 200,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(
                      color: Color(0xff9d9d9d),
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // date
                            Column(
                              children: [
                                Text(
                                  "23",
                                  style: GoogleFonts.rubik(
                                      color: Color(0xffBE4330), fontSize: 22),
                                ),
                                const SubText(
                                  text: "الاثنين",
                                  color: Colors.black,
                                ),
                                const SubText(text: "10:30 AM"),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, bottom: 0, right: 15),
                              child: Container(
                                width: 2,
                                color: Color(0xff9d9d9d),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:  [
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://media.istockphoto.com/photos/doctor-holding-digital-tablet-at-meeting-room-picture-id1189304032?k=20&m=1189304032&s=612x612&w=0&h=ovTNnR0JX2cRZkzMBed9exRO_PamZLlysLDFkXesr4Q="),
                                        radius: 35,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      HeadLineText(text: "د.نادية الكاظمي",color: Colors.blue,size: 20,lineHeight: 1,),
                                      SubText(text: "اسنان")
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Breakline(
                      color: Color(0xff9d9d9d),
                      height: 0.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(text: "العيادة",size: 18,),
                          SubText(text: "ماء الحياة",color: Colors.blue,),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
