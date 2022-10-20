import 'package:flutter/material.dart';
import 'package:kapi/screens/discover_screen.dart';
import 'package:kapi/screens/search_screen.dart';
import '../settings_screen.dart';
import '../home_screen.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int _selectedIndex = 0;
  // final _pageViewController = PageController();

  // @override
  // void dispose() {
  //   _pageViewController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> loginData = {
      "username": "YOUR_USERNAME",
      "password": "YOUR_PASSWORD"
    };

    void _onItemTapped(int index) {
      // _pageViewController.animateToPage(index,
      //     duration: Duration(microseconds: 200), curve: Curves.easeInOut);
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kapi'),
      ),
      body:
          // Text('asd'),
          // PageView(
          //     controller: _pageViewController,
          // physics: NeverScrollableScrollPhysics(),
          IndexedStack(
        index: _selectedIndex,
        children: [
          MyHomeScreen(),
          MySearchScreen(),
          MyDiscoverScreen(),
          SettingsScreen()
        ],
      ),
      // onPageChanged: (index) => setState(() {
      //       _selectedIndex = index;
      //     })),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
