// import 'package:fanme_flutter/views/pages/home/home.dart';
import 'package:fanme_flutter/views/pages/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primaryColor: Color(0xFF003049),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
