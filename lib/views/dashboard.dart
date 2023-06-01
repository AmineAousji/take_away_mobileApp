import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key: key);

  @override
  _HomePageState createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];
  _HomePageState();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print(this.widget);
    _widgetOptions = <Widget>[];
  }

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: 'TakeAway',
          centerTitle: true
          )
      );
  }
}