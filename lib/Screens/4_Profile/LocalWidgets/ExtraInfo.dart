import 'package:flutter/material.dart';

class ExtraInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: Container(
        child: Column(
          children: [
            Text(
              "Log out",
              style: TextStyle(color: Colors.redAccent, fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Privacy Policy",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Terms Of Service",
              style: TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
