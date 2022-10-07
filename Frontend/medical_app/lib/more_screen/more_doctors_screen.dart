import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:medical_app/reuseable_widgets/doctor_card.dart';
import 'package:medical_app/reuseable_widgets/waiting.dart';

import '../main.dart';
import '../main_colors.dart';
import '../models/doctor/doctor.dart';
import '../models/doctor/doctors.dart';

class MoreDoctorsScreen extends StatefulWidget {
  final String more_url;
  const MoreDoctorsScreen({
    Key? key,
    required this.more_url,
  }) : super(key: key);

  @override
  State<MoreDoctorsScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreDoctorsScreen> {
  late int totalPages;
  final RefreshController refreshController = RefreshController(initialRefresh: true);
  int current_page = 1;
  List<Doctor> doctors=[];

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
        "${widget.more_url}$current_page";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      
      final result = doctorsFromJson(response.body);
      if (isReferesh) {
        doctors = result.data;
      }else{
        doctors.addAll(result.data);
      }
      current_page++;
      
      totalPages = result.pageCount;
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
              print("image => ${doctors[index].images}");
              return DoctorCard(
                fullName: doctors[index].fullName,
                speciality: doctors[index].specialty?.title,
                image:
                    doctors[index].images == null?"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png":'http://10.0.2.2:8000/${doctors[index].images}',
              );
            },
          ),
        ),
      ),
    );
  }
}
