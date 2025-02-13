import 'package:flutter/material.dart';

Color customWarmGrey = Color(0xFFA7A59A);

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: customWarmGrey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.input), label: 'Spot'),
        BottomNavigationBarItem(icon: Icon(Icons.input), label: 'Lure'),
        BottomNavigationBarItem(icon: Icon(Icons.input), label: 'Time'),
        BottomNavigationBarItem(icon: Icon(Icons.input), label: 'Tide'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'About'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/spot');
            break;
          case 2:
            Navigator.pushNamed(context, '/lure');
            break;
          case 3:
            Navigator.pushNamed(context, '/time');
            break;
          case 4:
            Navigator.pushNamed(context, '/tide');
            break;
          case 5:
            Navigator.pushNamed(context, '/about');
            break;
        }
      },
    );
  }
}
