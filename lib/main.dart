import 'package:flutter/material.dart';
import 'package:take_away_app/views/dashboard.dart';
import 'package:take_away_app/views/loginPage.dart';




void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.light(),
      darkTheme:ThemeData.dark(),
    );
  }
}


