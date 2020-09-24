import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'GoalClass.dart';

class Goals extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

List<GoalClass> myGoals = [
  GoalClass(
      goalText: "Java Learning",
      missionText: "20/40 missions",
      completetedText: "50%",
      widgetColor: Color(0xFF7E5FF9)),
  GoalClass(
      goalText: "Web Development ",
      missionText: "30/40 missions",
      completetedText: "75%",
      widgetColor: Color(0xFFFF8C73)),
  GoalClass(
      goalText: "Flutter App",
      missionText: "40/40 missions",
      completetedText: "100%",
      widgetColor: Color(0xFFE5F5FE)),
  GoalClass(
      goalText: "Design  ",
      missionText: "30/40 missions",
      completetedText: "75%",
      widgetColor: Colors.redAccent)
];

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: myGoals.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
          height: 130,
          width: 390,
          decoration: BoxDecoration(
            color: myGoals[index].widgetColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    myGoals[index].goalText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    myGoals[index].missionText,
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        myGoals[index].completetedText,
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
