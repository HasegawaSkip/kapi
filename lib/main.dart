import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapi/screens/components/scaffold.dart';

import 'data/kavita/api/api_client.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = CounterObserver();
  // ApiClient();
  // await ApiClient.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kapi',
      home: const MyScaffold(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
