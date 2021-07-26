import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        backgroundColor: Colors.black,
        primaryColor: Colors.black,
        accentColor: Color(0xFF1AF509),
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Movies'),
    );
  }
}
