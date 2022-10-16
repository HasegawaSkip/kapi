import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int newIndex) {
        setState(() => _currentIndex = newIndex);
      },
      items: const [
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home'),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Search'),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.explore),
            icon: Icon(Icons.explore_outlined),
            label: 'Discover'),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Setttings')
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
    );
  }
}
