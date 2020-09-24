import 'package:flutter/material.dart';
import 'package:taskplanner/Screens/Global_Widgets/Upper-AppBar.dart';

import 'LocalWidgets/ExtraInfo.dart';
import 'LocalWidgets/ProfileDetails.dart';
import 'LocalWidgets/SettingList.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'profilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          UpperAppBar(
            middleText: "Profile",
          ),
          ProfileDetails(),
          Expanded(child: SettingList()),
          ExtraInfo(),
        ],
      ),
    );
  }
}
