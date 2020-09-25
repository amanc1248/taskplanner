import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taskplanner/Screens/Global_Widgets/Upper-AppBar.dart';

import '../../Provider.dart';

class IdeasPage extends StatefulWidget {
  static const String id = 'ideasPage';

  @override
  _IdeasPageState createState() => _IdeasPageState();
}

showingAllTheList() {
  List<Widget> theTodaysList = [];

  if (theNoteProvider.ourAllnotes.isEmpty) {
    return SizedBox();
  } else {
    for (var i = 0; i < theNoteProvider.ourAllnotes.length; i++) {
      theTodaysList.add(Theme(
        data: ThemeData(unselectedWidgetColor: Colors.orangeAccent),
        child: CheckboxListTile(
          title: Text(
            theNoteProvider.ourAllnotes[i].note,
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

  return Expanded(
      child: ListView(
    children: theTodaysList,
  ));
}

var theNoteProvider;

class _IdeasPageState extends State<IdeasPage> {
  Widget build(BuildContext context) {
    theNoteProvider = Provider.of<TheData>(context, listen: false);

    return Consumer<TheData>(
      builder: (context, value, child) => Column(
        children: [
          UpperAppBar(
            middleText: "Your Notes",
          ),
          Container(
            child: showingAllTheList(),
          ),
        ],
      ),
    );
  }
}
