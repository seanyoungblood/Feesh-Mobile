import 'package:flutter/material.dart';
import '../components/app_logo.dart';
import '../components/nav_bar.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "This is a high-tech minimalist app designed for an intuitive user experience.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          AppLogo(),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
