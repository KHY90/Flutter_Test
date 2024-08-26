import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(BurgersApp());
}

class BurgersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '햄버거 좋아',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: BurgersHomePage(),
    );
  }
}