import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                  ));
  }
}