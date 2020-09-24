import 'package:flutter/material.dart';
import 'package:taskplanner/Screens/2_Planner/LocalWidgets/SkipDoneButtonClass.dart';

class SkipDoneButton extends StatefulWidget {
  final List<SkipDoneButtonClass> skipButtonList = [
    SkipDoneButtonClass(
        buttonName: "Skip", icon: Icons.close, iconColor: Colors.greenAccent),
    SkipDoneButtonClass(
        buttonName: "Done", icon: Icons.done, iconColor: Colors.redAccent)
  ];
  @override
  _SkipDoneButtonState createState() => _SkipDoneButtonState();
}

class _SkipDoneButtonState extends State<SkipDoneButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.skipButtonList.length,
        itemBuilder: (context, index) => FlatButton(
          onPressed: () {},
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF333333),
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              height: 50,
              width: 165,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      widget.skipButtonList[index].icon,
                      color: widget.skipButtonList[index].iconColor,
                    ),
                    Center(
                      child: Text(
                        widget.skipButtonList[index].buttonName,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
