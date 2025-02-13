import 'package:flutter/material.dart';
import '../components/app_logo.dart';
import '../components/nav_bar.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text("Welcome to High-Tech App", style: Theme.of(context).textTheme.headlineLarge),
          ),
          AppLogo(),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
