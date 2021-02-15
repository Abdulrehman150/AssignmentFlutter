import 'package:flutter/material.dart';
import 'screens/InterviewScreening.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Flutter Demo',
      home: InterviewMainScreen(),
    );
  }
}
