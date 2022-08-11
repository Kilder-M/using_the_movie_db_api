import 'package:flutter/material.dart';

class LikesAndPopularityRowWidget extends StatelessWidget {
  final String? likesQuantity, popularityQuantity;

  const LikesAndPopularityRowWidget(
      {Key? key, this.likesQuantity, this.popularityQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
          child: Row(
            children: [
              const Icon(
                Icons.favorite,
                size: 16,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                likesQuantity ?? '1.2k likes',
                style: textStyle(),
              ),
              const SizedBox(
                width: 25,
              ),
              const Icon(
                Icons.favorite,
                size: 16,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                popularityQuantity ?? '200000',
                style: textStyle(),
              ),
            ],
          ),
        )
      ],
    );
  }

  TextStyle textStyle() => const TextStyle(color: Colors.grey);
}
