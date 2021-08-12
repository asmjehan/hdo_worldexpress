import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hdo_worldexpress/SplashScreenPage.dart';
import 'package:hdo_worldexpress/WebPageLoad.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Roboto",
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(),
      routes: {},
    );
  }
}
