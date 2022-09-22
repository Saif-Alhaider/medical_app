import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetails extends StatefulWidget {
  final String text;

  const DoctorDetails({super.key, required this.text});

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "تفاصيل",
          style: GoogleFonts.vazirmatn(
              fontSize: 18, color: Color.fromARGB(255, 166, 166, 166)),
        ),
        Container(
          child: secondHalf.isEmpty
              ? Text(firstHalf,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.vazirmatn(
                    fontSize: 14,
                  ))
              : Column(
                  children: <Widget>[
                    Text(
                        flag
                            ? (firstHalf + "...")
                            : (firstHalf + secondHalf),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.vazirmatn(
                          fontSize: 20,
                        )),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            flag ? "المزيد" : "اقل",
                            style: GoogleFonts.vazirmatn(
                                fontSize: 14, color: Colors.blue),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          flag = !flag;
                        });
                      },
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
