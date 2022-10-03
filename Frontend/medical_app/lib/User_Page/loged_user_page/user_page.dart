import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/User_Page/loged_user_page/profile%20details/darkModDetail.dart';
import 'package:medical_app/main.dart';
import 'package:medical_app/main_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:medical_app/User_Page/loged_user_page/profile%20details/profile_details.dart';
import 'package:medical_app/User_Page/loged_user_page/profile%20details/single_detail.dart';
import 'package:medical_app/models/user_model/account_model.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';

import '../../Main_View/main_view.dart';
import '../../reuseable_widgets/texts_types/sub_text.dart';
import '../hold_on_animation.dart';

class UserPage extends StatefulWidget {
  final String? full_name;
  final String? role;
  const UserPage({Key? key, required this.full_name, required this.role})
      : super(key: key);
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          // controller: controller,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 25,),
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
                  text: widget.full_name ?? "",
                  lineHeight: 1,
                  size: 28,
                ),
              ],
            ),
            SizedBox(height: 25,),
            DarkModDetail(),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ProfileDetails(role: widget.role),
            ),
            // -------doctor section-------------

            // -----------logout section-----------
            SizedBox(height: 25,),
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
                child: SinglDetail(
                    backgroundIconColor: Color(0xffF2F2F2),
                    icon: Icons.logout_rounded,
                    iconColor: Color(0xffD5D4D5),
                    title: "تسجيل خروج",
                    break_line: false,whereToGo: (){
                      showDialog(
                      context: context,
                      builder: (context) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: AlertDialog(
                          title: const HeadLineText(
                            text: "تسجيل الخروج",
                            lineHeight: 0,
                          ),
                          content: SizedBox(
                            height: 200,
                            width: double.maxFinite,
                            child: Stack(
                              children: [
                                Center(
                                  child: Transform.translate(
                                    offset: const Offset(0, -40),
                                    child: LottieBuilder.asset(
                                      "Assets/Lottie json/whistlin-koala.json",
                                      height: 140,
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.bottomRight,
                                  child: SubText(
                                    text: "هل انت متأكد من تسجيل الخروج ؟",
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ],
                            ),
                          ),
                          actionsOverflowButtonSpacing: 20,
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MainLiteColors.backgroundRed,
                                elevation: 0,
                                // shadowColor: Colors.transparent
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 4),
                                child: SubText(
                                  text: "كلا",
                                  color: MainLiteColors.foreignRed,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MainLiteColors.backgroundBlue,
                                elevation: 0,
                                // shadowColor: Colors.transparent
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove('token');
                                prefs.remove('fullName');
                                prefs.remove('account_id');
                                prefs.remove('account_type_id');
                                prefs.remove('account_type');

                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HoldOnAnimation(
                                      animationDirectory:
                                          'Assets/Lottie json/done.json',
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
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 4),
                                child: SubText(
                                  text: "نعم",
                                  color: MainLiteColors.foreignBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    }),
              ),
            ),
            SizedBox(height: 25,),
          ],
        ),
        ),
      ),
    );
  }
}