import 'package:flutter/material.dart';

abstract class ConstantValues {
  static final List<BoxShadow> cardShadow = [
    const BoxShadow(
        blurRadius: 40,
        color: Color.fromARGB(40, 0, 0, 0),
        offset: Offset(0, 2))
  ];

  static const SizedBox cardsGap =  SizedBox(
    width: 10,
    height: 10,
  );
}
