import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel',
      home: new HomePage(),
      theme: _kAppTheme,
    );
  }
}

final ThemeData _kAppTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: Colors.tealAccent,
    primaryColor: Colors.purple,
  );
}

