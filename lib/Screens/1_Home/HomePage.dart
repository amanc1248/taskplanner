import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskplanner/Screens/Global_Widgets/Upper-AppBar.dart';
import 'package:intl/intl.dart';

import '../../Provider.dart';
import '../../constants.dart';
import 'LocalWidgets/Goals.dart';
import 'LocalWidgets/My-Habits.dart';
import 'LocalWidgets/Section-Title.dart';
import 'LocalWidgets/SubSection-title.dart';
import 'LocalWidgets/TodaysNote.dart';

//
class HomePage extends StatefulWidget {
  static const String id = 'homePage';
  final String todaysDate =
      DateFormat('d MMMM').format(DateTime.now()).toLowerCase();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var theDataProvider;

  Widget build(BuildContext context) {
    theDataProvider = Provider.of<TheData>(context, listen: false);

    return Consumer<TheData>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              UpperAppBar(
                middleText: widget.todaysDate,
              ),
              Padding(
                padding: mainPagePadding,
                child: SectionTitle(),
              ),
              Container(
                height: 120,
                child: Goals(),
              ),
              Padding(
                padding: mainPagePadding,
                child: SubSectionTitle(
                  title: "My habits",
                  completedHabits: "1/3",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 8),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: MyHabit(),
                ),
              ),
              Padding(
                padding: mainPagePadding,
                child: SubSectionTitle(
                  title: "Today",
                  completedHabits: "1/3",
                ),
              ),
              Container(
                height: 120,
                child: TodaysNote(),
              ),
              Padding(
                padding: mainPagePadding,
                child: SubSectionTitle(
                  title: "Tomorrow",
                  completedHabits: "1/3",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
