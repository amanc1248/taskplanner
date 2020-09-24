import 'package:flutter/material.dart';
import 'package:taskplanner/constants.dart';

class SubSectionTitle extends StatelessWidget {
  final String title;
  final String completedHabits;
  SubSectionTitle({this.title, this.completedHabits});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kSectionAndSubSectionTitle,
          ),
          Container(
            height: 35,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                completedHabits,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
