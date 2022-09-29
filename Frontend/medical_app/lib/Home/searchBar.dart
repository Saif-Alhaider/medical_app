import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/models/doctor/doctorModel.dart';
import 'package:medical_app/models/doctors.dart';

class SearchBar extends StatelessWidget {
  Rx<bool> searchPageDisplay;
  Rx<bool> isSubmitted;
  SearchBar({
    Key? key,
    required this.searchPageDisplay,
    required this.isSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.blueAccent),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(56, 0, 0, 0),
                offset: Offset(2, 4),
                blurRadius: 8),
            BoxShadow(
                color: Color.fromARGB(255, 229, 228, 228),
                offset: Offset(-2, -4),
                blurRadius: 8),
          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: TextField(
        onSubmitted: (value) async {
          print("working");
          List? recivedData = await get_fetched_doctors(doctor_name: value);
          if (recivedData!.isNotEmpty) {
            isSubmitted.value = true;
          }
        },
        onTap: () => searchPageDisplay.value = true,
        style: const TextStyle(
            // height: 1.0,
            ),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Obx(() {
            return IconButton(
                onPressed: () {
                  searchPageDisplay.value = false;
                },
                icon: Icon(
                  Icons.close,
                  color: searchPageDisplay.value ? Colors.blue : Colors.black,
                ));
          }),
          border: InputBorder.none,
          // contentPadding: const EdgeInsets.only(right: 10),
        ),
      ),
    );
  }
}

Future<List>? get_fetched_doctors({required doctor_name}) async {
  final String url =
      "http://10.0.2.2:8000/api/doctor/search?doctor_full_name=$doctor_name";

  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body) as List;
    result = result
        .map((e) => Doctor(
            full_name: e['full_name'],
            speciality: e['speciality'],
            image: e['image']))
        .toList();
    return result;
  }
  return [];
}
