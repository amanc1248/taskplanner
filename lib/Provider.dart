import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskplanner/Screens/1_Home/LocalWidgets/TodaysNoteClass.dart';
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
        boxColor: Color(0xFFFFECE8), boxIcon: Icons.book, title: "Read Book"),
    MyHabitClass(
        boxColor: Color(0xFFE6F6FF), boxIcon: Icons.person, title: "Training"),
    MyHabitClass(
        boxColor: Color(0xFFFFF9EA),
        boxIcon: Icons.card_membership,
        title: "Learn English"),
    MyHabitClass(
        boxColor: Color(0xFFFFF9EA),
        boxIcon: Icons.card_membership,
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
//3.1 storing the date for the notes choosen date

  String _notesChoosenDate =
      DateFormat('y-MM-dd').format(DateTime.now()).toString();
  String get notesChoosenDate => _notesChoosenDate;
  set notesChoosenDate(String val) {
    _notesChoosenDate = val;
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

  //6) Storing the notes
  List<TodaysNoteClass> _ourAllnotes = [];
  List<TodaysNoteClass> get ourAllnotes => _ourAllnotes;
  set ourAllnotes(List<TodaysNoteClass> val) {
    _ourAllnotes = val;
    notifyListeners();
  }

  //selecting the goals
  showingTheDetailsBar() {
    int allTotalDays = 0;
    int allStreakDays = 0;
    double allSuccessRate = 0;
    int allTotalTimes = 0;
    if (mainGoalList.isEmpty) {
      return DetailsBar(
        streakDays: allStreakDays,
        successRate: allSuccessRate,
        totalDays: allTotalDays,
        totalTimesDone: allTotalTimes,
      );
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
      return DetailsBar(
        streakDays: allStreakDays,
        successRate: allSuccessRate,
        totalDays: allTotalDays,
        totalTimesDone: allTotalTimes,
      );
    }
  }

  //showing the todays note list
  showingTheTodaysList() {
    List<Widget> theTodaysList = [];

    if (ourAllnotes.isEmpty) {
      return SizedBox();
    } else {
      for (var i = 0; i < ourAllnotes.length; i++) {
        String todaysDate =
            DateFormat('y-MM-dd').format(DateTime.now()).toString();
        if ((ourAllnotes[i].dateTime == todaysDate) &&
            (ourAllnotes[i].status == false)) {
          theTodaysList.add(Theme(
            data: ThemeData(unselectedWidgetColor: Colors.orangeAccent),
            child: CheckboxListTile(
              title: Text(
                ourAllnotes[i].note,
                style: TextStyle(color: Colors.white),
              ),
              value: false,
              onChanged: (bool value) {},
              activeColor: Colors.orange,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ));
        }
      }
    }
    return Expanded(
        child: ListView(
      children: theTodaysList,
    ));
  }
}
