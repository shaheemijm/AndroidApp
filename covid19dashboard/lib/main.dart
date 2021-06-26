import 'package:flutter/material.dart';

import 'componants/MyHomePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xffB4A9D9),
        accentColor: Color(0xffD198CF),
        backgroundColor: Color(0xff47377f),
        cardColor: Color(0xffb25066),
        focusColor : Color(0xfff8f0f8),


      ),
      home: MyHomePage()

    );
  }
}

