// import 'package:flutter/material.dart';
// import 'package:taskplanner/Screens/Global_Widgets/Upper-AppBar.dart';

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';

// class CarouselDemo extends StatelessWidget {
//   static String id = '/misc/carousel';

//   static const List<String> fileNames = [
//     'assets/images/reading.jpg',
//     'assets/images/reading.jpg',
//     'assets/images/reading.jpg',
//   ];

//   final List<Widget> images =
//       fileNames.map((file) => Image.asset(file, fit: BoxFit.cover)).toList();

//   @override
//   Widget build(context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Carousel Demo'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: AspectRatio(
//             aspectRatio: 1,
//             child: Carousel(itemBuilder: widgetBuilder),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget widgetBuilder(BuildContext context, int index) {
//     return images[index % images.length];
//   }
// }

// typedef OnCurrentItemChangedCallback = void Function(int currentItem);

// class Carousel extends StatefulWidget {
//   final IndexedWidgetBuilder itemBuilder;

//   const Carousel({Key key, @required this.itemBuilder});

//   @override
//   _CarouselState createState() => _CarouselState();
// }

// class _CarouselState extends State<Carousel> {
//   PageController _controller;
//   int _currentPage;
//   bool _pageHasChanged = false;

//   @override
//   void initState() {
//     super.initState();
//     _currentPage = 0;
//     _controller = PageController(
//       viewportFraction: .85,
//       initialPage: _currentPage,
//     );
//   }

//   @override
//   Widget build(context) {
//     var size = MediaQuery.of(context).size;
//     return PageView.builder(
//       onPageChanged: (value) {
//         setState(() {
//           _pageHasChanged = true;
//           _currentPage = value;
//         });
//       },
//       controller: _controller,
//       itemBuilder: (context, index) => AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           var result = _pageHasChanged ? _controller.page : _currentPage * 1.0;

//           // The horizontal position of the page between a 1 and 0
//           var value = result - index;
//           value = (1 - (value.abs() * .5)).clamp(0.0, 1.0) as double;

//           return Center(
//             child: SizedBox(
//               height: Curves.easeOut.transform(value) * size.height,
//               width: Curves.easeOut.transform(value) * size.width,
//               child: child,
//             ),
//           );
//         },
//         child: widget.itemBuilder(context, index),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskplanner/Screens/Global_Widgets/Upper-AppBar.dart';

import '../../Provider.dart';
import 'LocalWidgets/Calendar.dart';
import 'LocalWidgets/HabitsCarousel.dart';
import 'LocalWidgets/SkipDoneButton.dart';

class PlannerPage extends StatefulWidget {
  static const String id = 'plannerPage';

  @override
  _PlannerPageState createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  @override
  void initState() {
    super.initState();
    // theDataProvider.showingTheDetailsBar();
  }

  var theDataProvider;
  Widget build(BuildContext context) {
    theDataProvider = Provider.of<TheData>(context, listen: false);

    return Consumer<TheData>(
      builder: (context, value, child) => Container(
        child: Column(
          children: [
            UpperAppBar(
              leftIcon: Icons.keyboard_arrow_left,
              middleText: "Habits",
              rightIcon: Icons.account_box,
            ),
            HabitsCarousel(),
            SkipDoneButton(),
            Container(height: 170, child: Calendar()),
            SizedBox(
              height: 60,
            ),
            theDataProvider.showingTheDetailsBar()
          ],
        ),
      ),
    );
  }
}
