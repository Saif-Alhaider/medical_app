import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarRating extends StatefulWidget {
  Rx<int> rate;
  bool functional;
  StarRating({
    Key? key,
    required this.rate,
    this.functional = true,
  }) : super(key: key);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  void rate(int rating) {
    widget.rate.value = rating;
    print(widget.rate.value);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.star,
                color: widget.rate >= 1 ? Colors.orange : Colors.grey,
              ),
              onTap: () => widget.functional == true?rate(1):null,
            ),
            GestureDetector(
              child: Icon(
                Icons.star,
                color: widget.rate >= 2 ? Colors.orange : Colors.grey,
              ),
              onTap: () => widget.functional == true?rate(2):null,
            ),
            GestureDetector(
              child: Icon(
                Icons.star,
                color: widget.rate >= 3 ? Colors.orange : Colors.grey,
              ),
              onTap: () => widget.functional == true?rate(3):null,
            ),
            GestureDetector(
              child: Icon(
                Icons.star,
                color: widget.rate >= 4 ? Colors.orange : Colors.grey,
              ),
              onTap: () => widget.functional == true?rate(4):null,
            ),
            GestureDetector(
              child: Icon(
                Icons.star,
                color: widget.rate >= 5 ? Colors.orange : Colors.grey,
              ),
              onTap: () => widget.functional == true?rate(5):null,
            ),
            const SizedBox(
              width: 10,
            ),
            // Text("${widget.rate.value.toDouble()}/5.0")
          ],
        );
      },
    );
  }
}