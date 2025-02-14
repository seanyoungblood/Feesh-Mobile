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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Feesh Finder",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 10), // Spacing between title and subtitle
                Text(
                  "The artificial intelligence fishing tool", // Additional text
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          AppLogo(),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
