import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../Provider.dart';

class Goals extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

// List<GoalClass> myGoals = [
//   GoalClass(
//       goalText: "Java Learning",
//       missionText: "20/40 missions",
//       completetedText: "50%",
//       widgetColor: Color(0xFF7E5FF9)),
//   GoalClass(
//       goalText: "Web Development ",
//       missionText: "30/40 missions",
//       completetedText: "75%",
//       widgetColor: Color(0xFFFF8C73)),
//   GoalClass(
//       goalText: "Flutter App",
//       missionText: "40/40 missions",
//       completetedText: "100%",
//       widgetColor: Color(0xFFE5F5FE)),
//   GoalClass(
//       goalText: "Design  ",
//       missionText: "30/40 missions",
//       completetedText: "75%",
//       widgetColor: Colors.redAccent)
// ];

class _GoalsState extends State<Goals> {
  var theGoalsProvider;
  Widget build(BuildContext context) {
    theGoalsProvider = Provider.of<TheData>(context, listen: false);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: theGoalsProvider.mainGoalList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
          height: 130,
          width: 370,
          decoration: BoxDecoration(
            color: Color(0xFF7E5FF9),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    theGoalsProvider.mainGoalList[index].topic,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    theGoalsProvider.mainGoalList[index].missionNumber,
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        theGoalsProvider.mainGoalList[index].totalDays
                            .toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      LinearPercentIndicator(
                        width: 170.0,
                        animation: true,
                        animationDuration: 1000,
                        lineHeight: 8.0,
                        percent: 0.5,
                        progressColor: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
              Container(
                child: Image(
                  image: AssetImage("assets/images/reading.jpg"),
                  height: 80,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
