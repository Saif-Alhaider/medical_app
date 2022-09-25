import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WaitingCarousel extends StatelessWidget {
  const WaitingCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.maxFinite,
      child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Shimmer.fromColors(
                            direction: ShimmerDirection.ltr,
                            baseColor: Color(0xffe1e1e1),
                            highlightColor: Color.fromARGB(64, 255, 255, 255),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: 100,
                                width: 200,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}