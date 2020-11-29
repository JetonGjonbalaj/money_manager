import 'package:flutter/material.dart';

// Constants
import './constants.dart';

// Screens
import './screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primaryColor: Colors.black,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.black),
          headline4: TextStyle(color: Colors.black),
          headline5: TextStyle(color: Colors.black),
          headline6: TextStyle(color: Colors.black),
          bodyText1: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0),
          bodyText2: TextStyle(fontWeight: FontWeight.w100, fontSize: 16.0)
        ),
      ),
      home: HomePage()
    );
  }
}