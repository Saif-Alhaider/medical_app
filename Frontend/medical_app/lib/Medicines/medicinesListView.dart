import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/Medicines/medicine_screen/medicine_screen.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';
import 'package:medical_app/reuseable_widgets/waiting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

import '../models/medicine/medicine_info.dart';
import '../more_screen/more_medicine_screen.dart';

class MedicinesListView extends StatefulWidget {
  const MedicinesListView({super.key});

  @override
  State<MedicinesListView> createState() => _MedicinesListViewState();
}

class _MedicinesListViewState extends State<MedicinesListView> {
  late Future<List>? dataFuture;
  @override


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeadLineText(
              text: "الادوية",
              color: Colors.blue,
              size: 35,
            ),
            Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoreMedicinesScreen(),
                              ));
                        },
                        child: SubText(text: "المزيد")),
                  )
          ],
        ),
        
        Container(
          height: 180,
          width: double.maxFinite,
          decoration: const BoxDecoration(),
          child: FutureBuilder(
            future: get_medicines(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Shimmer.fromColors(
                          direction: ShimmerDirection.ltr,
                          baseColor: Color(0xffe1e1e1),
                          highlightColor: Color.fromARGB(64, 255, 255, 255),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 100,
                              width: 200,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                case ConnectionState.done:
                default:
                  if (snapshot.hasError) {
                    return Text("something went wrong");
                  } else if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView.builder(
                      clipBehavior: Clip.none,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedicineScreen(medicine_id: snapshot.data![index].id),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(56, 0, 0, 0),
                                    offset: Offset(2, 4),
                                    blurRadius: 8),
                                BoxShadow(
                                    color: Color.fromARGB(255, 229, 228, 228),
                                    offset: Offset(-2, -4),
                                    blurRadius: 8),
                              ],
                            ),
                            width: 160,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 80,
                                  child: SvgPicture.asset(
                                    snapshot.data![index].medicine_image,
                                    height: 100,
                                  ),
                                ),
                                ConstantValues.cardsGap,
                                SubText(
                                  text: snapshot.data![index].title,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text("there is no data");
                  }
              }
            },
          ),
        ),
        ConstantValues.cardsGap,
        ConstantValues.cardsGap,
        ConstantValues.cardsGap,
        ConstantValues.cardsGap,
      ],
    );
  }
}

Future<List<Medicine>>? get_medicines() async {
  const String url = 'http://10.0.2.2:8000/api/medicines/?page_num=1';
  var response = await http.get(
    Uri.parse(url),
    headers: {
      "Content-Type": "application/json",
    },
  );
  final medicines = MedicineFromJson(response.body);
  return medicines;
  
}
