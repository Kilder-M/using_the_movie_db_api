import 'package:flutter/material.dart';

class LikesAndPopularityRowWidget extends StatelessWidget {
  final String? popularityQuantity;
  final int? likesQuantity;

  const LikesAndPopularityRowWidget(
      {Key? key, this.likesQuantity, this.popularityQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Row(
            children: [
              const Icon(
                Icons.favorite,
                size: 14,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${likesQuantity.toString()} Likes',
                style: textStyle(),
              ),
              const SizedBox(
                width: 25,
              ),
              const Icon(
                Icons.remove_red_eye_outlined,
                size: 14,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$popularityQuantity Popularity view',
                style: textStyle(),
              ),
            ],
          ),
        )
      ],
    );
  }

  TextStyle textStyle() => const TextStyle(color: Colors.grey, fontSize: 12);
}
