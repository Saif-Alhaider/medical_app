import 'package:flutter/material.dart';

import '../../../main_colors.dart';
import '../../../reuseable_widgets/break_line.dart';
import '../../../reuseable_widgets/texts_types/sub_text.dart';

class SinglDetail extends StatelessWidget {
  final bool break_line;
  final Color backgroundIconColor;
  final IconData icon;
  final Color iconColor;
  final String title;
  const SinglDetail({
    Key? key,
    this.break_line = true,
    required this.backgroundIconColor,
    required this.icon,
    required this.iconColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: double.maxFinite,
            height: 75,
            child: Row(
              
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: backgroundIconColor,
                      ),
                      child:  Icon(
                        icon,
                        color: iconColor,
                        size: 35,
                      ),
                    ),
                    
                  ],
                ),
                Expanded(
                  child: Container(
                    // color: Colors.green,
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
                                text: title,
                                color: Colors.black,
                              ),
                            ),
                         Icon(Icons.arrow_forward_ios_rounded,size: 25,)
                          ],
                        ),
                         Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: break_line?Breakline(color: Color.fromARGB(130, 0, 0, 0),height: 0.5,):null,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
