import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'pages/spot.dart';
import 'pages/lure.dart';
import 'pages/time.dart';
import 'pages/tide.dart';
import 'pages/about.dart';

Color customBlueGrey = Color(0xFF282C34);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'High-Tech App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: customBlueGrey,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/spot': (context) => Spot(),
        '/lure': (context) => Lure(),
        '/time': (context) => Time(),
        '/tide': (context) => Tide(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
