import 'package:flutter/material.dart';
import 'package:medical_app/unused_screens/Medicines/medicines_content.dart';
import 'package:medical_app/view/Home/searchBar.dart';
import 'package:medical_app/view/Home/search_screen.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/headline_text.dart';

import 'package:get/get.dart';
class Medicines extends StatelessWidget {
  Rx<bool> isSubmitted = Rx<bool>(false);
  Medicines({super.key});
  
  final Rx<bool> searchPageDisplay = Rx<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadLineText(text: "ابحث عن دواء او صيدلية",size: 32,),
                  SearchBar(searchPageDisplay: searchPageDisplay,isSubmitted: isSubmitted),
                  Expanded(
                  child: Stack(
                    children: [
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: searchPageDisplay.value
                              ?  SearchScreen(isSubmitted:isSubmitted ,)
                              : const MedicinesContent(),
                        );
                      }),
                      
                    ],
                  ),
                )
                ],
              ),
            )
        ),
      ),
    );
  }
}
