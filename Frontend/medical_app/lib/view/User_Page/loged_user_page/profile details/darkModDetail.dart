import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../theme/main_colors.dart';
import '../../../reuseable_widgets/texts_types/sub_text.dart';

class DarkModDetail extends StatefulWidget {
  const DarkModDetail({super.key});

  @override
  State<DarkModDetail> createState() => _DarkModDetailState();
}

class _DarkModDetailState extends State<DarkModDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.maxFinite,
        height: 70,
        decoration: BoxDecoration(
                    color: IsDark?Colors.transparent: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 40,
                          color: Color.fromARGB(40, 0, 0, 0),
                          offset: Offset(0, 8))
                    ],
                  ),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: IsDark?Colors.white:Colors.black,
                  ),
                  child: Icon(
                    Icons.nightlight_round,
                    color: IsDark?Colors.black:Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: SubText(
                            text: "الوضع الداكن",
                            color: IsDark
                                ? MainDarkColors.primaryFontColor
                                : MainLiteColors.primaryFontColor
                          ),
                        ),
                        Switch.adaptive(
                            value: IsDark,
                            onChanged: (value) {
                              IsDark = !IsDark;
                              setState(() {

                              });
                            })
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      // child: break_line
                      //     ? const Breakline(
                      //         color: Color.fromARGB(130, 0, 0, 0),
                      //         height: 0.5,
                      //       )
                      //     : null,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
