import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final String imageUrl;

  const BackgroundImageWidget(
      {Key? key,
      this.height,
      this.width,
      required this.imageUrl,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.65), BlendMode.dstATop),
          image: NetworkImage(
            imageUrl,
          ),
        ),
      ),
      child: child,
    );
  }
}
