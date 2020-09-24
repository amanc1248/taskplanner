import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskplanner/Screens/1_Home/LocalWidgets/My-Habits.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    // theDataProvider.onSelectedDate;
  }

  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        availableGestures: AvailableGestures.horizontalSwipe,
        onVisibleDaysChanged: (first, last, format) =>
            print("it definitely changed"),
        rowHeight: 70.0,
        onDaySelected: (day, events) {
          theDataProvider.calendarSelectedDay =
              DateFormat('y-MM-dd').format(day).toString();

          theDataProvider.showingTheDetailsBar();
        },
        daysOfWeekStyle: DaysOfWeekStyle(
          dowTextBuilder: (date, locale) {
            return DateFormat.E(locale).format(date)[0];
          },
          weekdayStyle: TextStyle(color: Colors.white70, fontSize: 16),
          weekendStyle: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        initialCalendarFormat: CalendarFormat.week,
        calendarStyle: CalendarStyle(
            markersColor: Colors.transparent,
            outsideStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w800),
            outsideWeekendStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w800),
            weekdayStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w800),
            weekendStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w800),
            canEventMarkersOverflow: true,
            todayStyle: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18.0,
                color: Colors.white)),
        headerVisible: true,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          leftChevronIcon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
          centerHeaderTitle: true,
          rightChevronIcon:
              Icon(Icons.keyboard_arrow_right, color: Colors.white),
        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
        builders: CalendarBuilders(
          selectedDayBuilder: (context, date, events) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  margin: const EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                        height: 1.2, color: Colors.white, fontSize: 17),
                  )),
            );
          },
          todayDayBuilder: (context, date, events) => Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.lightBlueAccent,
                  ),
                ),
                margin: const EdgeInsets.all(2.0),
                alignment: Alignment.center,
                child: Text(
                  date.day.toString(),
                  style:
                      TextStyle(height: 1.2, color: Colors.white, fontSize: 17),
                )),
          ),
        ),
        calendarController: _controller,
      ),
    );
  }
}
