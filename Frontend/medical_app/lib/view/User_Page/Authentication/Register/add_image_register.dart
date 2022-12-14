import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/view/Home/constants.dart';
import 'package:medical_app/view/Main_View/main_view.dart';
import 'package:medical_app/view/theme/main_colors.dart';
import 'package:medical_app/view/reuseable_widgets/next_skip_buttons.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/sub_text.dart';
import '../../../../main.dart';
import 'package:get/get.dart';

class AddUserImage extends StatelessWidget {
  const AddUserImage({super.key});
  static final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IsDark? MainDarkColors.bgColor:MainLiteColors.bgColor,
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
                Spacer(),
                Column(
                  children: [
                    LottieBuilder.asset(
                          'Assets/Lottie json/add_profile_pic.json',height: 300,width: 300,repeat: false,),
                    ConstantValues.cardsGap,
                    TextButton(
                      onPressed: () async {
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        print(image);
                      },
                      child: SubText(
                        text: "اضغط لاختيار الصورة",
                        color: IsDark
                            ? MainDarkColors.primaryFontColor
                            : MainLiteColors.primaryFontColor,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                NextSkipButtons(
                  nextFunction: (() {
                   Get.to(MainView());
                  }),
                  skipFunction: () {
                   Get.to(MainView());
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
