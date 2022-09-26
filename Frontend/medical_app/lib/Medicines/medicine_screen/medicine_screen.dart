import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/Home/constants.dart';

import 'package:medical_app/models/medicine/medicine_info.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xfff6f6f6),
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
                          HeadLineText(text: "معلومات عن الدواء"),
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [SubText(
                            text: "اسم الدواء: ${snapshot.data!.title}",
                            color: Colors.black,
                            size: 32,
                            textAlign: TextAlign.right,
                          ),
                          ConstantValues.cardsGap,
                          SubText(
                              text:
                                  " النوع: ${snapshot.data!.medicineType.name}",
                              color: Colors.black,
                              size: 25,
                              textAlign: TextAlign.right),],
                          ),
                          ),
                          ConstantValues.cardsGap,
                          Obx(() => ExpansionPanelList(
                                expansionCallback: (panelIndex, isExpanded) {
                                  flag.value = !isExpanded;
                                },
                                children: [
                                  ExpansionPanel(
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
                                        style: GoogleFonts.vazirmatn(fontSize: 20),
                                      ),
                                      isExpanded: flag.value)
                                ],
                              ))
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

Future<MedicineInfo> getMedicineById({required int id}) async {
  final String url =
      "http://10.0.2.2:8000/api/medicines/medicine_info?medicine_id=$id";
  var response = await http.get(Uri.parse(url), headers: {
    "Content-Type": "application/json",
  });
  var result = jsonDecode(response.body);
  result = MedicineInfo(
      title: result['title'],
      description: result['description'],
      medicineType:
          MedicineType.values.byName(result['medicinetype'].toLowerCase()));
  return result;
}
