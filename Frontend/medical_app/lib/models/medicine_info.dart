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

}


class TakingTimes {
  final TimeOfDay timeOfDay;
  final String? additionalInfo;
  TakingTimes({
    required this.timeOfDay,
    this.additionalInfo,
  });
}
