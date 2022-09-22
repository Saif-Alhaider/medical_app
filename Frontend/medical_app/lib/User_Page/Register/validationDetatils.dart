import 'package:flutter/material.dart';
import 'package:get/get.dart';

final TextEditingController firstName = TextEditingController();
final TextEditingController lastName = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController confirmPassword = TextEditingController();

String? emailValidation(String? value) {
  bool emailValidator = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);
  return emailValidator == false ? "الايميل غير صحيح" : null;
}


