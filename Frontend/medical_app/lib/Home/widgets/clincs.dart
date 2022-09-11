import 'package:flutter/cupertino.dart';
import '../../models/home_page/card_clinc_model.dart';
import 'cards/card_of_clinc.dart';

class Clincs extends StatelessWidget {
  const Clincs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width * 0.656,
        child: ListView.builder(
            itemCount: ClincList.length,
            itemBuilder: (context, index) => CardOfClinc(
                  clinc: ClincList[index],
                )));
  }
}
