import 'package:flutter/material.dart';
import 'package:taskplanner/Screens/4_Profile/LocalWidgets/SettingListClass.dart';

class SettingList extends StatelessWidget {
  final List<SettingListClass> listOfSetting = [
    SettingListClass(
        containerColor: Colors.blueAccent,
        settinIcon: Icons.cloud_upload,
        leftText: "iCloud",
        rightText: "Disablet"),
    SettingListClass(
        containerColor: Colors.yellowAccent,
        settinIcon: Icons.calendar_view_day,
        leftText: "Apple Calendar",
        rightText: "Disablet"),
    SettingListClass(
        containerColor: Colors.orangeAccent,
        settinIcon: Icons.settings,
        leftText: "General Settings",
        rightText: "Light"),
    SettingListClass(
        containerColor: Colors.redAccent,
        settinIcon: Icons.star,
        leftText: "Rating",
        rightText: ""),
    SettingListClass(
        containerColor: Colors.yellowAccent,
        settinIcon: Icons.calendar_view_day,
        leftText: "Support",
        rightText: ""),
    SettingListClass(
        containerColor: Colors.orangeAccent,
        settinIcon: Icons.settings,
        leftText: "General Settings",
        rightText: ""),
    SettingListClass(
        containerColor: Colors.white,
        settinIcon: Icons.indeterminate_check_box,
        leftText: "For the Project",
        rightText: "")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: listOfSetting.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: listOfSetting[index].containerColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Icon(
                        listOfSetting[index].settinIcon,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      listOfSetting[index].leftText,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      listOfSetting[index].rightText,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white70,
                      size: 30,
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
