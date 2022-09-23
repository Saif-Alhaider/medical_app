import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  Rx<bool> searchPageDisplay;
  SearchBar({
    Key? key,
    required this.searchPageDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.blueAccent),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(56, 0, 0, 0),
              offset: Offset(2,4),
               blurRadius: 8
            ),
            BoxShadow(
              color: Color.fromARGB(255, 229, 228, 228),
              offset: Offset(-2,-4),
              blurRadius: 8
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        onTap: () => searchPageDisplay.value = true,
        style: const TextStyle(
            // height: 1.0,
            ),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
              onPressed: () {
                searchPageDisplay.value = false;
              },
              icon: const Icon(Icons.close)),
          border: InputBorder.none,
          // contentPadding: const EdgeInsets.only(right: 10),
        ),
      ),
    );
  }
}
