import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                          height: 3,
                          width: double.maxFinite,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 12,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 20,
                                height: 3,
                                color: const Color(0xff9d9d9d),
                              );
                            },
                          ),
                        );
  }
}