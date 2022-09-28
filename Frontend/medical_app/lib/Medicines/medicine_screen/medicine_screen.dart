import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/Home/constants.dart';

import 'package:medical_app/models/medicine/medicine_info.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';
import 'package:medical_app/reuseable_widgets/waiting.dart';

class MedicineScreen extends StatelessWidget {
  final int medicine_id;
  final Rx<bool> flag = Rx<bool>(false);
  MedicineScreen({
    Key? key,
    required this.medicine_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getMedicineById(id: medicine_id);
    return Scaffold(
      extendBodyBehindAppBar:true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder(
            future: getMedicineById(id: medicine_id),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Waiting();
                case ConnectionState.done:
                default:
                  if (snapshot.hasError) {
                    return const Text("something went wrong");
                  } else if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 400,
                            width: double.maxFinite,
                            child:
                                Image.asset('Assets/images/pills-bottle.png'),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: ConstantValues.cardShadow,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(FontAwesome5.flask),
                                    ConstantValues.cardsGap,
                                    SubText(
                                      text: "${snapshot.data!.title}",
                                      color: Colors.black,
                                      size: 32,
                                      textAlign: TextAlign.right,
                                    )
                                  ],
                                ),
                                Breakline(
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                ConstantValues.cardsGap,
                                SubText(
                                    text:
                                        " النوع: ${snapshot.data!.medicinetype}",
                                    color: Colors.black,
                                    size: 25,
                                    textAlign: TextAlign.right),
                              ],
                            ),
                          ),
                          ConstantValues.cardsGap,
                          Obx(() => ExpansionPanelList(
                                elevation: flag.value ? 4 : 0,
                                expansionCallback: (panelIndex, isExpanded) {
                                  flag.value = !isExpanded;
                                },
                                children: [
                                  ExpansionPanel(
                                      // backgroundColor: Colors.transparent,
                                      headerBuilder: (context, isExpanded) {
                                        return Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "تفاصيل",
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 20),
                                            ),
                                          ),
                                        );
                                      },
                                      body: Text(
                                        snapshot.data!.description,
                                        style:
                                            GoogleFonts.vazirmatn(fontSize: 20),
                                      ),
                                      isExpanded: flag.value),
                                ],
                              )),
                          // HeadLineText(
                          //     text: "الصيدليات التي يتوفر فيها الدواء"),
                          // snapshot.data!.medicine_pharmacies!.length == 0
                              // ? SizedBox(
                              //     height: 400,
                              //     child: SubText(
                              //         text: "الدواء غير متوفر في اي صيدلية"))
                              // : Container(
                              //     margin: EdgeInsets.only(top: 10),
                              //     width: double.maxFinite,
                              //     height: 200,
                              //     child: ListView.builder(
                              //       clipBehavior: Clip.none,
                              //       scrollDirection: Axis.horizontal,
                              //       itemCount: snapshot
                              //           .data!.medicine_pharmacies!.length,
                              //       itemBuilder:
                              //           (BuildContext context, int index) {
                              //         return Container(
                              //           width: 180,
                              //           height: 60,
                              //           margin: EdgeInsets.only(right: 8),
                              //           decoration: BoxDecoration(
                              //               borderRadius:
                              //                   BorderRadius.circular(12),
                              //               color: Colors.white,
                              //               boxShadow:
                              //                   ConstantValues.cardShadow),
                              //           child: Column(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             children: [
                              //               SubText(
                              //                 text: snapshot.data!
                              //                         .medicine_pharmacies![
                              //                     index]['name'],
                              //               )
                              //             ],
                              //           ),
                              //         );
                              //       },
                              //     ),
                              //   )
                        ],
                      ),
                    );
                  } else {
                    return const Text("there is no data");
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<Medicine> getMedicineById({required int id}) async {
  final String url =
      "http://10.0.2.2:8000/api/medicines/medicine_info?medicine_id=$id";
  var response = await http.get(Uri.parse(url), headers: {
    "Content-Type": "application/json",
  });
  var result = jsonDecode(response.body);
  result = Medicine(id: id,
      title: result['title'],
      description: result['description'],
      medicinetype:result['medicinetype'],
      pharmacies: result['pharmacies']
      );
  return result;
}
