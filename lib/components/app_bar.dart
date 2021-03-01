import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:veggy/configs/app_theme.dart';

import 'horizontal_line.dart';

class MyAppBar {
  MyAppBar._();

  static final simpleAppBar = AppBar(
    title: Text("Veggy"),
    elevation: 0.0,
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          painter: HorizontalLine(
            endXOffset: 25.0,
            strokeWidth: 3.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        CustomPaint(
          painter: HorizontalLine(
            endXOffset: 18.0,
            strokeWidth: 3.0,
          ),
        ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Icon(
          Icons.notifications_none,
        ),
      ),
    ],
  );

  static final sliverAppBar = SliverAppBar(
    title: Text(
        "Veggy",
    ),
    centerTitle: false,
    expandedHeight: 200.0,
    floating: false,
    pinned: false,
    backgroundColor: AppTheme.myGreen,
    flexibleSpace: FlexibleSpaceBar(
      background: Align(
        alignment: Alignment.bottomRight,
        child: Container(
            width: 280.0,
            child: Image.asset(
                "assets/images/basket.png",
              fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );
}