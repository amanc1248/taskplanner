import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskplanner/Screens/AddButton.dart/AllGoalsClass.dart';

import 'Screens/1_Home/LocalWidgets/My-HabitsClass.dart';
import 'Screens/2_Planner/LocalWidgets/DetailsBar.dart';

class TheData extends ChangeNotifier {
  //1) For storing widgets of habitcontainer
  List<Widget> _habitsList = [];
  List<Widget> get habitsList => _habitsList;
  set habitsList(List<Widget> val) {
    _habitsList = val;
    notifyListeners();
  }

  //2) Storing the habits
  List<MyHabitClass> _myHabits = [
    MyHabitClass(
        boxColor: Color(0xFFFFECE8),
        boxImage: AssetImage("assets/images/reading.jpg"),
        title: "Read Book"),
    MyHabitClass(
        boxColor: Color(0xFFE6F6FF),
        boxImage: AssetImage("assets/images/reading.jpg"),
        title: "Training"),
    MyHabitClass(
        boxColor: Color(0xFFFFF9EA),
        boxImage: AssetImage("assets/images/reading.jpg"),
        title: "Learn English")
  ];
  List<MyHabitClass> get myHabits => _myHabits;
  set myHabits(List<MyHabitClass> val) {
    _myHabits = val;
    notifyListeners();
  }

  //3 Storing the choosen date
  String _choosenDate = DateFormat('y-MM-dd').format(DateTime.now()).toString();
  String get choosenDate => _choosenDate;
  set choosenDate(String val) {
    _choosenDate = val;
    notifyListeners();
  }

  //4) storing the main goals
  List<AllGoalsStore> _mainGoalsList = [];
  List<AllGoalsStore> get mainGoalList => _mainGoalsList;
  set mainGoalList(List<AllGoalsStore> val) {
    _mainGoalsList = val;
    notifyListeners();
  }

  //5)calendar selected day
  String _calendarSelectedDay =
      DateFormat('y-MM-dd').format(DateTime.now()).toString();
  String get calendarSelectedDay => _calendarSelectedDay;
  set calendarSelectedDay(String val) {
    _calendarSelectedDay = val;
    notifyListeners();
  }

  //selecting the goals
  showingTheDetailsBar() {
    int allTotalDays = 0;
    int allStreakDays = 0;
    double allSuccessRate = 0;
    int allTotalTimes = 0;
    if (mainGoalList.isEmpty) {
      return SizedBox();
    } else {
      for (int i = 0; i < mainGoalList.length; i++) {
        if (calendarSelectedDay == mainGoalList[i].dateTime) {
          allStreakDays = mainGoalList[i].streakDays + allStreakDays;
          allTotalDays = mainGoalList[i].totalDays + allTotalDays;
          allSuccessRate = mainGoalList[i].successRate + allSuccessRate;
          allTotalTimes = mainGoalList[i].totalTimeDone + allTotalTimes;
        } else {
          print("opps date not matched!");
        }
      }
    }
    return DetailsBar(
      streakDays: allStreakDays,
      successRate: allSuccessRate,
      totalDays: allTotalDays,
      totalTimesDone: allTotalTimes,
    );
  }
}
