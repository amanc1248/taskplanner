import 'package:flutter/material.dart';

class UpperAppBar extends StatelessWidget {
  final IconData leftIcon;
  final String middleText;
  final IconData rightIcon;
  UpperAppBar({this.leftIcon, this.middleText, this.rightIcon});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            leftIcon,
            color: Colors.white,
            size: 45,
          ),
          Text(
            middleText,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Icon(
            rightIcon,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
