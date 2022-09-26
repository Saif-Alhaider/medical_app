import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/Main_View/main_view.dart';
import 'package:medical_app/main_colors.dart';
import 'package:medical_app/reuseable_widgets/next_skip_buttons.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class AddUserImage extends StatelessWidget {
  const AddUserImage({super.key});
  static final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 'Assets/images/profile_pic.jpg'
                Column(
                  children: [
                    Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xff7c94b6),
                        image: const DecorationImage(
                          image: AssetImage('Assets/images/profile_pic.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: MainColors.foreignBlue,
                          width: 4.0,
                        ),
                      ),
                    ),
                    ConstantValues.cardsGap,
                    TextButton(
                      onPressed: () async {
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                            print(image);
                      },
                      child: SubText(
                        text: "اضغط لاختيار الصورة",
                      ),
                    ),
                  ],
                ),
                NextSkipButtons(
                  nextFunction: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainView(),));
                  }),
                  skipFunction: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainView(),));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
