import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

convert_to_active_dates({required List activeDates}) {
  List? data = [];
  List active_dates = activeDates.map((e) {
    e = DateTime.parse(e).toLocal();
    return e;
  }).toList();
  active_dates.sort((a, b) {
    return a.compareTo(b);
  });
  for (var date in active_dates) {
    date = date.toString().split(" ");
    data.add(date);
  }
  Map<DateTime, List<TimeOfDay>> similarData = {};
  data.sort((a, b) {
    if (a[0].compareTo(b[0]) == 0) {
      
      similarData[DateTime.parse(a[0])] = [
        TimeOfDay(
            hour: int.parse(a[1].split(":")[0]),
            minute: int.parse(a[1].split(":")[1])),
        TimeOfDay(
            hour: int.parse(b[1].split(":")[0]),
            minute: int.parse(b[1].split(":")[1]))
      ];
    }
    return 0;
  });
  for (var date in data) {
    List<TimeOfDay> temp = [];
    if (!similarData.containsKey(DateTime.parse(date[0]))) {
      temp.add(TimeOfDay(
            hour: int.parse(date[1].split(":")[0]),
            minute: int.parse(date[1].split(":")[1])));
      similarData[DateTime.parse(date[0])] = temp;
    }
  }

  return similarData;
}
