import 'package:flutter/material.dart';
import 'package:medical_app/doctor_page/doctor_page.dart';

import '../models/doctor/doctor.dart';
import '../models/home_card_info.dart';

// import 'doctor.dart';

class AnimatedDoctorCard extends StatelessWidget {
  final bool? active;
  final int? index;
  final HomeCardInfo? doctor;

  const AnimatedDoctorCard({
    Key? key,
    this.active,
    this.index,
    this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double blur = active! ? 16 : 0;
    final double offsetY = active! ? 4 : 0;
    final double top = active! ? 0 : 46;
    final double left = active! ? 32.5 : 0;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(
        top: top,
        bottom: 0,
        right: 15.5,
        left: left,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color.fromARGB(85, 0, 0, 0),
        //     blurRadius: blur,
        //     offset: Offset(0, offsetY),
        //   )
        // ],
        image: DecorationImage(
          image: NetworkImage(doctor?.image == "http://10.0.2.2:8000/null"
              ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
              : doctor!.image),
          fit: BoxFit.cover,
        ),
        // color: Colors.white,
      ),
      child: GestureDetector(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>DoctorPage(doctor_id: doctor!.id),));
      },child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 61, 100, 131).withOpacity(0.8),
                    Colors.white.withOpacity(0.3),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  tileMode: TileMode.clamp,
                  stops: [0.2, 0.6]),
            ),
          ),
          Positioned(
            // left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 87,
              padding: const EdgeInsets.only(top: 10, left: 24, right: 16),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32))),
              child: Text(
                doctor!.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 84,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  doctor?.subTitle != null?
                  Container(
                    height: 34,
                    // width: 60,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.5,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Text(
                      doctor?.subTitle ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ):SizedBox(),
                  Row(
                    children: [
                      Icon(Icons.share),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.bookmark_add)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
