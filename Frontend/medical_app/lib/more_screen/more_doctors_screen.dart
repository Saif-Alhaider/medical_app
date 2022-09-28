import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/reuseable_widgets/doctor_card.dart';
import 'package:medical_app/reuseable_widgets/waiting.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/doctors.dart';

class MoreDoctorsScreen extends StatefulWidget {
  const MoreDoctorsScreen({super.key});

  @override
  State<MoreDoctorsScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreDoctorsScreen> {
  late int totalPages;
  final RefreshController refreshController = RefreshController(initialRefresh: true);
  int current_page = 1;
  List<OneDoctor> doctors=[];

  Future getAllDoctors({bool isReferesh = false}) async {
    if (isReferesh) {
      current_page = 1;
    }else{
      if (current_page > totalPages) {
        
        refreshController.loadNoData();
        return false;
      }
    }
    final String url =
        "http://10.0.2.2:8000/api/doctor/doctors?page_num=$current_page";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      
      final result = DoctorsFromJson(response.body);
      if (isReferesh) {
        doctors = result.doctors;
      }else{
        doctors.addAll(result.doctors);
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
            final result = await getAllDoctors(isReferesh: true);
            if (result) {
              refreshController.refreshCompleted();
            }else{
              refreshController.refreshFailed();
            }
          },
          onLoading: () async{
            final result = await getAllDoctors(isReferesh: false);
            if (result) {
              refreshController.loadComplete();
            }
          },
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.65),
            itemCount: doctors.length,
            itemBuilder: (BuildContext context, int index) {
              return DoctorCard(
                fullName: doctors[index].fullName,
                speciality: doctors[index].speciality,
                image:
                    'http://10.0.2.2:8000/'+doctors[index].image,
              );
            },
          ),
        ),
      ),
    );
  }
}
