import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:taskplanner/Provider.dart';
import 'package:provider/provider.dart';

class HabitsCarousel extends StatefulWidget {
  static const String id = 'habitsCarousel';

  @override
  _HabitsCarouselState createState() => _HabitsCarouselState();
}

var theDataProvider;

class _HabitsCarouselState extends State<HabitsCarousel> {
  @override
  Widget build(BuildContext context) {
    theDataProvider = Provider.of<TheData>(context, listen: false);
    return Consumer<TheData>(
      builder: (context, value, child) => Container(
          child: CarouselSlider(
        options: CarouselOptions(
          height: 120,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        items: theDataProvider.habitsList.map<Widget>((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: 200,
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: i);
            },
          );
        }).toList(),
      )),
    );
  }
}
