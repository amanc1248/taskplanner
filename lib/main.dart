import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskplanner/Provider.dart';
import 'package:taskplanner/navigationbar.dart';

import 'Screens/1_Home/HomePage.dart';
import 'Screens/2_Planner/LocalWidgets/HabitsCarousel.dart';
import 'Screens/3_Ideas/IdeasPage.dart';
import 'Screens/4_Profile/ProfilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TheData>(create: (context) => TheData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              // backgroundColor: Colors.white,
              ),
        ),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: MainEntryFile.id,
        routes: {
          HomePage.id: (context) => HomePage(),
          // PlannerPage.id: (context) => PlannerPage(),
          HabitsCarousel.id: (context) => HabitsCarousel(),
          IdeasPage.id: (context) => IdeasPage(),
          ProfilePage.id: (context) => ProfilePage(),
          MainEntryFile.id: (context) => MainEntryFile()
        },
      ),
    );
  }
}
