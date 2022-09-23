import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartRate extends StatelessWidget {
  const StartRate({
    Key? key,
    required this.rate,
    required this.size,
  }) : super(key: key);

  final int rate;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 5 - rate; i > 0; i--)
           Icon(
            Icons.star,
            color: Colors.grey,
            size: size ,
          ),
        for (int i = 0; i < rate; i++)
           Icon(
            Icons.star,
            color: Color(0xffFFD700),
            size: size,
          ),
      ],
    );
  }
}
