import 'package:flutter/material.dart';
import 'package:troca_conhecimento/pages/home_page.dart';
import 'package:troca_conhecimento/theme/theme.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: themeData,
      home: HomePage(title: 'Movies'),
    );
  }
}
