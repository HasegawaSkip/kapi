import 'package:flutter/material.dart';
import 'package:kapi/screens/legacy/settings_screen_legacy.dart';
import 'package:kapi/screens/legacy/home_screen_legacy.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  Map<String, dynamic> loginData = {
    "username": "YOUR_USERNAME",
    "password": "YOUR_PASSWORD"
  };

  final _pageViewController = PageController();
  int _activePage = 0;

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageViewController,
        children: [
          MyBody(loginData: loginData),
          MyBody(loginData: loginData),
          MyBody(loginData: loginData),
          SettingsScreen()
        ],
        onPageChanged: (index) => setState(() => _activePage = index));
  }
}
