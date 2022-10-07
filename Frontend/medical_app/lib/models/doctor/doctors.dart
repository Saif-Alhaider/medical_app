// To parse this JSON data, do
//
//     final DataPagenation = DoctorsPagenationFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

import 'doctor.dart';

DataPagenation doctorsFromJson(String str) => DataPagenation.fromJson(json.decode(str));

String doctorsToJson(DataPagenation data) => json.encode(data.toJson());

class DataPagenation {
  DataPagenation({
    required this.totalCount,
    required this.perPage,
    required this.fromRecord,
    required this.toRecord,
    required this.previousPage,
    required this.nextPage,
    required this.currentPage,
    required this.pageCount,
    required this.data,
  });

  final int totalCount;
  final int perPage;
  final int fromRecord;
  final int toRecord;
  final int previousPage;
  final int nextPage;
  final int currentPage;
  final int pageCount;
  final List<Doctor> data;

  factory DataPagenation.fromJson(Map<String, dynamic> json) => DataPagenation(
        totalCount: json["total_count"],
        perPage: json["per_page"],
        fromRecord: json["from_record"],
        toRecord: json["to_record"],
        previousPage: json["previous_page"],
        nextPage: json["next_page"],
        currentPage: json["current_page"],
        pageCount: json["page_count"],
        data: List<Doctor>.from(json["data"].map((x) => Doctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "per_page": perPage,
        "from_record": fromRecord,
        "to_record": toRecord,
        "previous_page": previousPage,
        "next_page": nextPage,
        "current_page": currentPage,
        "page_count": pageCount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

