import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../reuseable_widgets/star_rating.dart';
import 'Specialties/specialties_clinic.dart';
import 'card_doctor/special_doctors.dart';
import 'details/details_clinic.dart';

class DataClinic extends StatefulWidget {
 
  const DataClinic({
    Key? key,
    
  }) : super(key: key);

  @override
  State<DataClinic> createState() => _DataClinicState();
}

class _DataClinicState extends State<DataClinic> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          Transform.translate(
              offset: const Offset(0, -260),
              child: Stack(children:[Image.asset('Assets/clinic/Rectangle546.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(icon: const Icon(Icons.arrow_back_ios),onPressed: (){}),
              )
              ])),
          Transform.translate(
            offset: const Offset(0, 275),
            child: Stack(children: [
              Container(
                width: 400,
                height: 600,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24))),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                      Icon(Icons.favorite, color:Colors.black)
                      ,Text('عيادة الهدى',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                    ],),
                     
                 
        
           Transform.translate(
            offset:Offset(10,0),
            
             child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StarRating(rate: Rx<int>(4),functional: false,),
              ],
                     ),
           ),
        
                    const Padding(
                      padding: EdgeInsets.only(top:8.0),
                      child: details(),
                    ),
                    const Specialties(),
                     const SizedBox(height: 8,),
                     const Text('الاطباء',style:TextStyle(fontSize: 20,)),
                    
                    const SizedBox(height: 8,),
          const SpecialDoctors()
                  ],
                ),
              )
            ]),
          )
        ])
      ]),
    );
  }
}



