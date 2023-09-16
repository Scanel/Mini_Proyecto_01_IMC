import 'package:flutter/material.dart';
import 'package:miniproyecto_01/src/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Proyecto 01',
      home: HomePage(),
    );
  }
}
