import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.maxLength,
    required this.hint,
  }) : super(key: key);

  final int maxLength;
  final RxInt textLength = 0.obs;
  final String hint;
  final Color primaryTextColor = Colors.black;
  final Color seconderyTextColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: SizedBox(
        height: 48,
        child: TextFormField(
          textAlign: TextAlign.end,
          maxLength: maxLength,
          cursorColor: primaryTextColor,
          onChanged: (value) {
            textLength.value = value.length;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 20, right: 16),
            counterText: "",
            /*prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 32),
              child: Obx(
                    () => Text(
                  '${textLength.toString()}/${maxLength.toString()}',
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),*/

            //prefixStyle: TextStyle(color: primaryColor,fontSize: 12,),
            counterStyle: TextStyle(color: primaryTextColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.2), width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.2), width: 0),
            ),
            filled: true,
            //<-- SEE HERE
            fillColor: Colors.grey.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}