import 'package:flutter/material.dart';

class MySearchScreen extends StatefulWidget {
  const MySearchScreen({super.key});

  @override
  State<MySearchScreen> createState() => _MySearchScreenState();
}

class _MySearchScreenState extends State<MySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('All'),
              onTap: (() => print('asd')),
            ),
          )
        ],
      ),
    );
  }
}
