import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool validate;
  final String errormsg;
  final bool isPrivate;
  final bool description;
  final String? Function(String?)? validator;
  const RegisterTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validate = false,
    this.errormsg = 'error',
    this.isPrivate = false,
    required this.validator,  this.description = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: description?64 + (5 *24):64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xfffdfdfd),
              boxShadow: const [
                BoxShadow(blurRadius: 20, color: Color.fromARGB(44, 0, 0, 0))
              ]),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            maxLines: description?5:1,
            maxLength: null,
            
            obscureText: isPrivate?true:false,
            enableSuggestions: isPrivate?false:true,
            autocorrect: isPrivate?false:true,
            controller: controller,
            decoration: InputDecoration(
              hintStyle: GoogleFonts.vazirmatn(
                  fontSize: 22, color: Color(0xffC4C4C4)),
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              border: InputBorder.none,
              errorText: validate ? errormsg : null,
            ),
            validator: validator,
          ),
        )
      ],
    );
  }
}
