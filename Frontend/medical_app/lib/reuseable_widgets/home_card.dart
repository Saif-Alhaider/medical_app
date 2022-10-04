import 'package:flutter/material.dart';
import 'package:medical_app/Clinic/clinic_main.dart';

import 'package:medical_app/doctor_page/doctor_page.dart';
import 'package:medical_app/models/doctor/doctorModel.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

import '../models/home_card_info.dart';

class HomeCard extends StatelessWidget {
  final List<HomeCardInfo>? info;
  final bool goToDoctor;
  
  const HomeCard({
    Key? key,
    required this.info,
    required this.goToDoctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 60,
              spreadRadius: 0.5,
              color: Color.fromARGB(23, 0, 0, 0))
        ],
      ),
      height: 350,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: info!.length,
        itemBuilder: (context, index) {
          print(info?[index].image);
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    // return goToDoctor? DoctorPage(doctor_id: info![index].id):ClinicMain();
                    return DoctorPage(doctor_id: 1);
                  },
                )),
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 250,
              decoration: BoxDecoration(
                  color: const Color(0xffFDFDFD),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 200,
                        child: Image.network(
                          info?[index].image == "http://10.0.2.2:8000/null"?"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png":info![index].image,
                          fit: BoxFit.cover,
                        )),
                    SubText(
                      text: info![index].title,
                      color: Colors.black,
                    ),
                    SubText(
                      text: info?[index].subTitle??"",
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
