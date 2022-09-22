import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'circle_indicators.dart';

class StartButton extends StatelessWidget {
  final PageController controller;
  const StartButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        backgroundColor: Colors.blue,
                        minimumSize: const Size.fromHeight(30)
                        
                      ),
                    
                      onPressed: () async{
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('showHome', true);
                        Navigator.pushReplacementNamed(context, '/main');
                      },
                      child: Text("ابدء",style: GoogleFonts.vazirmatn(fontSize: 30,color: Colors.white),)),
          ),
        ],
      ),
    );
  }
}
