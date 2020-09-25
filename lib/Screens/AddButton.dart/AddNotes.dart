import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taskplanner/Screens/1_Home/LocalWidgets/TodaysNoteClass.dart';
import 'package:taskplanner/constants.dart';

import '../../Provider.dart';

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final _actcontroller = TextEditingController();

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  addingTheNotes() {
    theDataProvider.ourAllnotes.add(
      TodaysNoteClass(
        note: _actcontroller.text,
        dateTime: theDataProvider.notesChoosenDate,
        status: false,
      ),
    );
    theDataProvider.showingTheTodaysList();
  }

  var theDataProvider;
  Widget build(BuildContext context) {
    theDataProvider = Provider.of<TheData>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
          // color: Color(0xFF1F2024),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Notes',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _actcontroller,
            decoration: new InputDecoration(
              labelText: "Enter your Note",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                // borderSide: new BorderSide(),
              ),
            ),
            validator: (val) {
              if (val.length == 0) {
                return "Menu cannot be empty";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2020, 1, 1),
                        maxTime: DateTime(2020, 12, 30),
                        theme: DatePickerTheme(
                          headerColor: Colors.orange,
                          backgroundColor: Colors.blue,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ), onChanged: (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                    }, onConfirm: (date) {
                      String theConvertedDate =
                          DateFormat('y-MM-dd').format(date).toString();
                      theDataProvider.notesChoosenDate = theConvertedDate;
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Center(
                        child: Text(
                      "Choose the date:",
                      style: mostTextStyle,
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Text("Date"),
              ),
            ],
          ),
          Center(
            child: FlatButton(
              onPressed: () {
                if (_actcontroller.text == null) {
                  print("Cannot add null topic");
                } else {
                  addingTheNotes();
                  Navigator.pop(context);
                }
              },
              child: Text("Add"),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
