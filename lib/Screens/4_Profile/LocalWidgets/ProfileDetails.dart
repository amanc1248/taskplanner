import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.lightGreen,
            backgroundImage: AssetImage("assets/images/reading.jpg"),
            radius: 25,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Juilly slaony",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                    color: Color(0xFF7E5FF9),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Center(
                  child: Text(
                    "PRO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("JuilySalouni@gmail.com",
              style: TextStyle(color: Colors.white70, fontSize: 16))
        ],
      ),
    );
  }
}
