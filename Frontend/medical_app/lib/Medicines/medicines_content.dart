import 'package:flutter/material.dart';
import 'package:medical_app/Medicines/medicinesListView.dart';
import 'package:medical_app/Medicines/medicines_main.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

import '../models/medicine/medicine_categories.dart';


class MedicinesContent extends StatelessWidget {
  const MedicinesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: [
        
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.85),
          itemCount: medicineCategories.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(8),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: Image.asset(medicineCategories[index]['image']),
                  ),
                  SubText(
                    text: medicineCategories[index]['title'],
                    color: const Color(0xff39E8BE),
                    size: 36,
                  ),
                ],
              ),
            );
          },
        ),
        const MedicinesListView(),
      ],
    ),
    );
  }
}
