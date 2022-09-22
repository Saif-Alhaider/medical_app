import 'package:flutter/material.dart';

class MedicineDetails {
  final String name;
  final int frequency;
  final List<TakingTimes> takingTimes;
  MedicineDetails({
    required this.name,
    required this.frequency,
    required this.takingTimes,
  });
  get timesinfo {
    final medicineInfoTimes = [];
    for (var i = 0; i < takingTimes.length; i++) {
      medicineInfoTimes.add(
        {
          "date": takingTimes[i].timeOfDay,
          "additional Info":takingTimes[i].additionalInfo,
        },
      );
    }
    return medicineInfoTimes;
  }
}

class TakingTimes {
  final TimeOfDay timeOfDay;
  final String? additionalInfo;
  TakingTimes({
    required this.timeOfDay,
    this.additionalInfo,
  });
}
