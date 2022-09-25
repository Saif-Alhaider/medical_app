import 'package:flutter/material.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/main_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:medical_app/User_Page/loged_user_page/profile%20details/profile_details.dart';
import 'package:medical_app/User_Page/loged_user_page/profile%20details/single_detail.dart';
import 'package:medical_app/models/user_model/account_model.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';

import '../../Main_View/main_view.dart';
import '../hold_on_animation.dart';

class UserPage extends StatefulWidget {
  final String? full_name;
  final String? role;
  const UserPage({
    Key? key,
    required this.full_name,
    required this.role
  }) : super(key: key);
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // static String? full_name;
  // Future<Null> getUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   full_name = prefs.getString("fullName");
  //   print(full_name);
  // }

  

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                      // 'https://api.lorem.space/image/face?w=150&h=150',
                      "https://i.pinimg.com/originals/97/e4/2a/97e42a82fc7911961d3ca55f54d1372c.jpg"),
                ),
                const SizedBox(height: 18),
                HeadLineText(
                  text: widget.full_name??"",
                  lineHeight: 1,
                  size: 28,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ProfileDetails(role: widget.role),
            ),
            // -------doctor section-------------
            
            // -----------logout section-----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.maxFinite,
                // height: 380,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 40,
                        color: Color.fromARGB(40, 0, 0, 0),
                        offset: Offset(0, 8))
                  ],
                ),
                child: GestureDetector(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.remove('token');
                    prefs.remove('fullName');

                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HoldOnAnimation(
                          animationDirectory: 'Assets/Lottie json/done.json',
                          whenItEnds: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainView(),
                                ),
                                (Route<dynamic> route) => false);
                          },
                        ),
                      ),
                    );
                  },
                  child: const SinglDetail(
                      backgroundIconColor: Color(0xffF2F2F2),
                      icon: Icons.logout_rounded,
                      iconColor: Color(0xffD5D4D5),
                      title: "تسجيل خروج",
                      break_line: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
