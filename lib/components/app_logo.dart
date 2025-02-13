import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: Opacity(
        opacity: 0.5,
        child: ClipOval(
          child: Image.asset(
            'assets/LogoWithTxt.png',  // Ensure this file exists in assets/
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
