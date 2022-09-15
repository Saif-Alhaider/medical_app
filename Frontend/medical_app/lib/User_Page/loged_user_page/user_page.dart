import 'package:flutter/material.dart';
import 'package:medical_app/User_Page/loged_user_page/profile%20details/profile_details.dart';
import 'package:medical_app/User_Page/loged_user_page/profile%20details/single_detail.dart';
import 'package:medical_app/models/user_model/account_model.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? username;
  Future<Null> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    for (UserAccount user in User.users) {
      if (user.email == prefs.getString('userEmail')) {
        setState(() {
          username = "${user.firstName} ${user.lastName}";
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    String? accountName = username ?? 'unknow';
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
                    "https://i.pinimg.com/originals/97/e4/2a/97e42a82fc7911961d3ca55f54d1372c.jpg"
                  ),
                ),
                const SizedBox(height: 18),
                HeadLineText(
                  text: "$accountName",
                  lineHeight: 1,
                  size: 28,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ProfileDetails(),
            ),
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
                child: const SinglDetail(
                    backgroundIconColor: Color(0xffF2F2F2),
                    icon: Icons.logout_rounded,
                    iconColor: Color(0xffD5D4D5),
                    title: "تسجيل خروج",
                    break_line: false),
              ),
            )
          ],
        ),
      ),
    );
  }
}
