import 'package:flutter/material.dart';

class MyDiscoverScreen extends StatefulWidget {
  const MyDiscoverScreen({super.key});

  @override
  State<MyDiscoverScreen> createState() => _MyDiscoverScreenState();
}

class _MyDiscoverScreenState extends State<MyDiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.explore),
    );
  }
}
