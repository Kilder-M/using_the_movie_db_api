import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final double? width, height, iconSize;
  final Color? backgroundColor, iconColor;
  final void Function()? onTapButton;

  const BackButtonWidget(
      {Key? key,
      this.width,
      this.height,
      this.backgroundColor,
      this.iconColor,
      this.iconSize,
      this.onTapButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: backgroundColor ?? Colors.black),
      child: Center(
        child: GestureDetector(
          onTap: onTapButton,
          child: Icon(
            Icons.chevron_left_rounded,
            color: iconColor ?? Colors.white,
            size: iconSize ?? 26,
          ),
        ),
      ),
    );
  }
}
