import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/Controller/validations.dart';
import 'package:medical_app/view/User_Page/Authentication/Register/validationDetatils.dart';
import 'package:medical_app/view/reuseable_widgets/registerTextField.dart';

class DoctorRegister extends StatelessWidget {
  const DoctorRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            LottieBuilder.asset(
              'Assets/Lottie json/doctor_register.json',
              repeat: false,
            ),
            RegisterTextField(
              hintText: "الايميل",
              controller: TextEditingController(),
              validator: (p0) => emailValidation(p0),
            ),
            Row(children: [
              Expanded(
                child: RegisterTextField(
                hintText: "الاسم الاخير",
                controller: TextEditingController(),
                validator: (p0) => nameValidation(p0),
                          ),
              ),Expanded(
                child: RegisterTextField(
                hintText: "الاسم الاول",
                controller: TextEditingController(),
                validator: (p0) => nameValidation(p0),
                          ),
              )
            ],)
          ],
        ),
      ),
    );
  }
}
