// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Function() onPressed;
  final double iconSize;
  final IconData icon;
  final Color color;

  const CustomIcon({
    Key? key,
    required this.onPressed,
    required this.iconSize,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize,
      ),
      color: color,
    );
  }
}
