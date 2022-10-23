import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/view/theme/main_colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
class BottomSalamonNavigationBar extends StatelessWidget {
  final Rx<int> currentIndex;
  final PageController pageController;
  const BottomSalamonNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return SalomonBottomBar(
          itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          currentIndex: currentIndex.value,
          onTap: (i) {
            currentIndex.value = i;
            pageController.jumpToPage(i);
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home,
                size: 35,
                color: MainLiteColors.foreignBlue,
              ),
              title: const Text("الرئيسية",style: TextStyle(fontSize: 16,)),
              selectedColor: Colors.blue,
            ),

            /// Likes
            // SalomonBottomBarItem(
            //   icon: const Icon(
            //     Icons.medication_outlined,
            //     size: 35,
            //     color: MainColors.foreignBlue,
            //   ),
            //   title: const Text("الادوية",style: TextStyle(fontSize: 16,color: MainColors.foreignBlue)),
            //   selectedColor: Colors.blue,
            // ),

            /// Search
            SalomonBottomBarItem(
              
              icon: const Icon(
                Icons.person_outline,
                size: 35,
                color: MainLiteColors.foreignBlue,
              ),
              title: const Text("الحساب",style: TextStyle(fontSize: 16,)),
              selectedColor: Colors.blue,
            ),

            /// Profile
          ],
        );
    });
  }
}
