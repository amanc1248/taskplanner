import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskplanner/Screens/1_Home/LocalWidgets/AlertAddHabits.dart';
import 'package:taskplanner/Screens/1_Home/LocalWidgets/My-HabitsClass.dart';

import '../../../Provider.dart';

class MyHabit extends StatefulWidget {
  addingHabits() {
    theDataProvider.habitsList = <Widget>[];
    for (int i = 0; i < theDataProvider.myHabits.length; i++) {
      theDataProvider.habitsList.add(Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Container(
              height: 70,
              width: 65,
              decoration: BoxDecoration(
                  color: theDataProvider.myHabits[i].boxColor,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Icon(
                theDataProvider.myHabits[i].boxIcon,
                size: 25,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              theDataProvider.myHabits[i].title,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ));
    }
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: theDataProvider.habitsList,
      ),
    );
  }

  @override
  _MyHabitState createState() => _MyHabitState();
}

var theDataProvider;

class _MyHabitState extends State<MyHabit> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Your New Habit Here"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    controller: _controller,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add'),
                onPressed: () {
                  theDataProvider.myHabits.add(MyHabitClass(
                      boxColor: Color(0xFFFFF9EA),
                      boxIcon: Icons.card_membership,
                      title: _controller.text));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    theDataProvider = Provider.of<TheData>(context, listen: false);

    return Consumer<TheData>(
      builder: (context, value, child) => Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      createAlertDialog(context);
                    },
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "New",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            widget.addingHabits()
          ],
        ),
      ),
    );
  }
}
