import 'package:flutter/material.dart';

import '../models/ontifications_models/ontifications_account.dart';
import 'cards.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Transform.translate(
          offset: Offset(-140, 50),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        Transform.translate(
          offset: const Offset(100, 65),
          child: const Text(
            'الاشعارات',
            style: TextStyle(
              fontSize: 32,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        Row(
            children: DataNot_1.datas
                .map((e) => Card_1(
                      not: e,
                    ))
                .toList()),
        Row(
            children: DataNot_2.datas
                .map((e) => Card_2(
                      not: e,
                    ))
                .toList())
        // const Card_2()
      ]),
    );
  }
}
