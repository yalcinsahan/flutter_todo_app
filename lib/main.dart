import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/AddScreen.dart';
import 'package:flutter_todo_app/screens/HomeScreen.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
