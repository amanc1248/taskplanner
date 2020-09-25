import 'package:flutter/material.dart';
import 'package:taskplanner/Screens/2_Planner/LocalWidgets/HabitsCarousel.dart';
import 'package:taskplanner/Screens/3_Ideas/IdeasPage.dart';
import 'package:taskplanner/Screens/4_Profile/ProfilePage.dart';

import 'Screens/1_Home/HomePage.dart';
import 'Screens/2_Planner/PlannerPage.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'Screens/AddButton.dart/AddGoals.dart';
import 'Screens/AddButton.dart/AddNotes.dart';

class MainEntryFile extends StatefulWidget {
  static const String id = 'entryPoint';

  @override
  _MainEntryFile createState() => _MainEntryFile();
}

class _MainEntryFile extends State<MainEntryFile> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _children = [
    HomePage(),
    PlannerPage(),
    HabitsCarousel(),
    IdeasPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF1F2024),
          body: Center(child: _children.elementAt(_selectedIndex)),
          floatingActionButton: SpeedDial(
            animatedIconTheme: IconThemeData(size: 15.0),
            marginRight: MediaQuery.of(context).size.width / 2 - 15,
            marginBottom: 45.0,
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                color: Color(0xFF7E5FF9),
              ),
              child: Icon(Icons.add),
            ),
            closeManually: false,
            curve: Curves.bounceIn,
            overlayOpacity: 0,
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 8.0,
            children: [
              SpeedDialChild(
                  child: Icon(Icons.book),
                  backgroundColor: Colors.blue,
                  label: 'Add Notes',
                  labelStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: AddNotes(),
                              ),
                            ));
                  }),
              SpeedDialChild(
                child: Icon(Icons.track_changes),
                backgroundColor: Colors.red,
                label: 'Add Goals',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddGoals(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  //                    <--- top side
                  color: Color(0xFF383940),
                  width: 1.0,
                ),
              ),
              color: Color(0xFF1F2024),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.event), title: Text("Planner")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle,
                        size: 25, color: Colors.transparent),
                    title: Text("Add")),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.insert_drive_file,
                    ),
                    title: Text("Ideas")),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_circle,
                    ),
                    title: Text("Profile")),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xFF7E5FF9),
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
