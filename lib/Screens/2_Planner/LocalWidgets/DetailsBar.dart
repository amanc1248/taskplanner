import 'package:flutter/material.dart';
import 'package:taskplanner/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailsBar extends StatefulWidget {
  final int totalDays;
  final int streakDays;
  final double successRate;
  final int totalTimesDone;
  DetailsBar(
      {this.streakDays, this.successRate, this.totalDays, this.totalTimesDone});
  @override
  _DetailsBarState createState() => _DetailsBarState();
}

class _DetailsBarState extends State<DetailsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 2,
            color: Colors.grey,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 22, bottom: 22, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Icon(Icons.leak_add, color: Colors.yellowAccent),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.totalDays.toString(),
                      style: mostTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.streakDays.toString(),
                      style: mostTextStyle,
                    )
                  ],
                ),
                Column(
                  children: [
                    new CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 5.0,
                      percent: widget.successRate,
                      center: new Text(
                        "30%",
                        style: mostTextStyle,
                      ),
                      progressColor: Colors.green,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Success Rate",
                      style: mostTextStyle,
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.done,
                      color: Colors.redAccent,
                      size: 30,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.totalTimesDone.toString(),
                      style: mostTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Total times done",
                      style: mostTextStyle,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
