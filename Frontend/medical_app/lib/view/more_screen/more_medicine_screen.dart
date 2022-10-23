import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/view/Home/constants.dart';
import 'package:medical_app/models/clinic/clinic_model.dart';
import 'package:medical_app/models/medicine/medicine_info.dart';
import 'package:medical_app/view/reuseable_widgets/doctor_card.dart';
import 'package:medical_app/view/reuseable_widgets/waiting.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../unused_screens/Medicines/medicine_screen/medicine_screen.dart';
import '../../models/doctor/doctors.dart';
import '../reuseable_widgets/texts_types/sub_text.dart';

class MoreMedicinesScreen extends StatefulWidget {
  const MoreMedicinesScreen({super.key});

  @override
  State<MoreMedicinesScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreMedicinesScreen> {
  late int totalPages;
  final RefreshController refreshController = RefreshController(initialRefresh: true);
  int current_page = 1;
  List<Medicine> medicines=[];

  Future getAllClincis({bool isReferesh = false}) async {
    if (isReferesh) {
      current_page = 1;
    }else{
      if (current_page > totalPages) {
        
        refreshController.loadNoData();
        return false;
      }
    }
    final String url =
        "http://10.0.2.2:8000/api/medicines/?page_num=$current_page";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      
      final result = medicinesFromJson(response.body);
      if (isReferesh) {
        medicines = result.medicines;
      }else{
        medicines.addAll(result.medicines);
      }
      current_page++;
      
      totalPages = result.numPages;
      // print(doctors);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SmartRefresher(
          enablePullUp: true,
          controller: refreshController,
          onRefresh: () async{
            final result = await getAllClincis(isReferesh: true);
            if (result) {
              refreshController.refreshCompleted();
            }else{
              refreshController.refreshFailed();
            }
          },
          onLoading: () async{
            final result = await getAllClincis(isReferesh: false);
            if (result) {
              refreshController.loadComplete();
            }
          },
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.65),
            itemCount: medicines.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedicineScreen(medicine_id: medicines[index].id),
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
                                    medicines[index].medicine_image,
                                    height: 100,
                                  ),
                                ),
                                ConstantValues.cardsGap,
                                SubText(
                                  text: medicines[index].title,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}
