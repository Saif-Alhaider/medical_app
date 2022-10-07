import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/main.dart';
import 'package:medical_app/main_colors.dart';
import 'package:medical_app/models/clinic/clinic_model.dart';
import 'package:medical_app/reuseable_widgets/doctor_card.dart';
import 'package:medical_app/reuseable_widgets/waiting.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/doctor/doctors.dart';
import '../reuseable_widgets/texts_types/sub_text.dart';

class MoreClinicsScreen extends StatefulWidget {
  const MoreClinicsScreen({super.key});

  @override
  State<MoreClinicsScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreClinicsScreen> {
  late int totalPages;
  final RefreshController refreshController = RefreshController(initialRefresh: true);
  int current_page = 1;
  List<Clinic> clinics=[];

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
        "http://10.0.2.2:8000/api/clinics/?page_num=$current_page";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      
      final result = ClinicsFromJson(response.body);
      if (isReferesh) {
        clinics = result.clinics;
      }else{
        clinics.addAll(result.clinics);
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
      backgroundColor: IsDark? MainDarkColors.bgColor:MainLiteColors.bgColor,
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
            itemCount: clinics.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
              margin: const EdgeInsets.all(10),
              width: 250,
              decoration: BoxDecoration(
                boxShadow: ConstantValues.cardShadow,
                  color: const Color(0xffFDFDFD),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 200,
                        child: Image.network(
                          'http://10.0.2.2:8000/images/'+clinics[index].image,
                          fit: BoxFit.cover,
                        )),
                    SubText(
                      text: clinics[index].name,
                      color: Colors.black,
                      overflow: true,
                    ),
                    SubText(
                      text: "",
                      size: 15,
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
