import 'package:flutter/material.dart';

class Breakline extends StatelessWidget {
  final Color color;
  final double height;
  const Breakline({
    Key? key,
     this.color = Colors.black,
     this.height = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height,
      color: color,
    );
  }
}
