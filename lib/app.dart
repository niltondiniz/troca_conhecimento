import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:troca_conhecimento/pages/pilot_page.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(
        backgroundColor: Colors.black,
        primaryColor: Colors.black,
        accentColor: Color(0xFF1AF509),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          headline2: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          subtitle1: TextStyle(
            fontSize: 11,
            color: Colors.white38,
            fontWeight: FontWeight.w200,
          ),
          bodyText1: TextStyle(
            fontSize: 13,
            color: Colors.white54,
            fontWeight: FontWeight.w300,
          ),
          bodyText2: TextStyle(
            fontSize: 13,
            color: Color(0xFF1AF509),
            fontWeight: FontWeight.w500,
          ),
          caption: TextStyle(
            fontSize: 13,
            color: Colors.yellow,
            fontWeight: FontWeight.w500,
          ),
          subtitle2: TextStyle(
            fontSize: 13,
            color: Colors.white30,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      home: PilotPage(title: 'Movies'),
    );
  }
}
