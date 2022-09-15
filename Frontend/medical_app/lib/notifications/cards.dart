import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ontifications_models/ontifications_account.dart';

class Card_1 extends StatelessWidget {
  const Card_1({
    Key? key,
    required this.not,
  }) : super(key: key);
  final DataNot_1 not;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 8, left: 16, bottom: 8),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 350,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 203, 201),
                borderRadius: BorderRadius.circular(15)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(not.text,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ),
                Stack(alignment: Alignment.center, children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Icon(
                    not.icon,
                    size: 25,
                  )
                ]),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 75, left: 16, right: 16),
              child: Text(
                '2022-2-5',
                style: TextStyle(
                  fontSize: 16,
                ),
              ))
        ],
      ),
    );
  }
}

class Card_2 extends StatelessWidget {
  const Card_2({
    Key? key,
    required this.not,
  }) : super(key: key);
  final DataNot_2 not;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 0, left: 16, bottom: 8),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 350,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 105, 218, 190),
                borderRadius: BorderRadius.circular(15)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(not.text,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ),
                Stack(alignment: Alignment.center, children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Icon(
                    not.icon,
                    size: 25,
                  )
                ]),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 75, left: 16, right: 16),
              child: Text(
                '2022-2-5',
                style: TextStyle(
                  fontSize: 16,
                ),
              ))
        ],
      ),
    );
  }
}
