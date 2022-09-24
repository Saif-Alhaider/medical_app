import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home/constants.dart';
import '../models/medicine/medicine_details.dart';
import '../reuseable_widgets/texts_types/sub_text.dart';
import '../reuseable_widgets/timeLine.dart';

class MedicinesInfo extends StatefulWidget {
  

  final List<MedicineDetails> medicineInfo;

  MedicinesInfo({
    Key? key,
    required this.medicineInfo,
  }) : super(key: key);
  
  @override
  State<MedicinesInfo> createState() => _MedicinesInfoState();
}

class _MedicinesInfoState extends State<MedicinesInfo> {
  @override
  Widget build(BuildContext context) {
    
    final List<ExpansionItem> _items2 =widget.medicineInfo.map((MedicineDetails medicine) {
      return ExpansionItem(
          header: medicine.name,
          
          body: SizedBox(
            width: double.maxFinite,
            height: 200,
            child: TimeLine(
              numOfTimes: medicine.takingTimes.length,
              circleSize: 30,
              ballsGap: 35,
              infoList: medicine.takingTimes.map((TakingTimes e) {
                return  TimeLineInfo(timeOfDay: e.timeOfDay, info: e.additionalInfo??"");
              }).toList(),
            ),
          ));
    }).toList();
    
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return ExpansionPanelList(
      elevation: 0,
      dividerColor: Colors.transparent,
      expansionCallback: (panelIndex, isExpanded) {
        setState((){_items2[panelIndex].isExpanded =
            !_items2[panelIndex].isExpanded;});
      },
      children: _items2.map((ExpansionItem item) {
        return ExpansionPanel(
            backgroundColor: Colors.transparent,
            body: item.body!,
            headerBuilder: (context, isExpanded) {
              return Row(
                children: [
                  SubText(
                    text: widget.medicineInfo[_items2.indexOf(item)].frequency.toString(),
                    color: Colors.black,
                  ),
                  ConstantValues.cardsGap,
                  SubText(
                    text: item.header!,
                    color: Colors.black,
                  ),
                ],
              );
            },
            isExpanded: item.isExpanded);
      }).toList(),
    );
      },
    );
  }
}

class ExpansionItem {
  bool isExpanded;
  String? header;
  Widget? body;
  ExpansionItem({
    this.isExpanded = false,
    this.header,
    this.body,
  });
}
