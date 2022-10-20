import 'package:flutter/material.dart';
import 'package:medical_app/models/home_card_info.dart';
import 'package:get/get.dart';

import '../reuseable_widgets/animated_doctor_card.dart';

class DoctorsCards extends StatefulWidget {
  final List<HomeCardInfo> doctors;
  const DoctorsCards({super.key, required this.doctors});

  @override
  State<DoctorsCards> createState() => _DoctorsCardsState();
}

class _DoctorsCardsState extends State<DoctorsCards> {
  PageController _pageController = PageController(viewportFraction: 0.75);
  Rx<int> currentPage = Rx<int>(0);
  late bool active;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      int position = _pageController.page!.round();
      if (currentPage != position) {
        currentPage.value = position;
        // setState(() {});
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 401,
              child: PageView.builder(
                clipBehavior: Clip.none,
                itemCount: widget.doctors.length,
                padEnds: false,
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  
                  return Obx(() {
                    active = index == currentPage.value;
                    return AnimatedDoctorCard(
                        active: active,
                        index: index,
                        doctor: widget.doctors[index],
                      );
                  });
                },
              ),
            );
  }
}