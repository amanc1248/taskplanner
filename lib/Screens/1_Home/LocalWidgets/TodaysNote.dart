// Flutter code sample for CheckboxListTile

//
// This widget shows a checkbox that, when checked, slows down all animations
// (including the animation of the checkbox itself getting checked!).
//
// This sample requires that you also import 'package:flutter/scheduler.dart',
// so that you can reference [timeDilation].

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider.dart';

/// This Widget is the main application widget.

// ignore: must_be_immutable
class TodaysNote extends StatefulWidget {
  TodaysNote({Key key}) : super(key: key);
  bool boxChecked = false;
  // List<TodaysNoteClass> todaysNote = [
  //   TodaysNoteClass(
  //       note:
  //           "Make a prototype of the main page and make a presentation for the customer"),
  //   TodaysNoteClass(note: "Make a prototype")
  // ];
  @override
  _TodaysNoteState createState() => _TodaysNoteState();
}

class _TodaysNoteState extends State<TodaysNote> {
  var theDataProvider;

  Widget build(BuildContext context) {
    theDataProvider = Provider.of<TheData>(context, listen: false);

    return Consumer<TheData>(
      builder: (context, value, child) => Container(
        child: theDataProvider.showingTheTodaysList(),
      ),
    );
  }
}
