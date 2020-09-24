import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  color: theDataProvider.myHabits[i].boxColor,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Image(image: theDataProvider.myHabits[i].boxImage),
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
                  Container(
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
