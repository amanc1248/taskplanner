// Flutter code sample for CheckboxListTile

//
// This widget shows a checkbox that, when checked, slows down all animations
// (including the animation of the checkbox itself getting checked!).
//
// This sample requires that you also import 'package:flutter/scheduler.dart',
// so that you can reference [timeDilation].

import 'package:flutter/material.dart';
import 'package:taskplanner/Screens/1_Home/LocalWidgets/TodaysNoteClass.dart';

/// This Widget is the main application widget.

// ignore: must_be_immutable
class TodaysNote extends StatefulWidget {
  TodaysNote({Key key}) : super(key: key);
  bool boxChecked = false;
  List<TodaysNoteClass> todaysNote = [
    TodaysNoteClass(
        note:
            "Make a prototype of the main page and make a presentation for the customer"),
    TodaysNoteClass(note: "Make a prototype")
  ];
  @override
  _TodaysNoteState createState() => _TodaysNoteState();
}

class _TodaysNoteState extends State<TodaysNote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.todaysNote.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(
              widget.todaysNote[index].note,
              style: TextStyle(color: Colors.white),
            ),
            value: widget.boxChecked,
            onChanged: (bool value) {
              setState(() {
                widget.boxChecked = !widget.boxChecked;
              });
            },
            activeColor: Colors.orange,
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
          );
        },
      ),
    );
  }
}
