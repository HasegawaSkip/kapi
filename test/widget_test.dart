// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('Can Create Preferences', () async {
    SharedPreferences.setMockInitialValues({}); //set values here
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool working = false;
    String name = 'john';
    pref.setBool('working', working);
    pref.setString('name', name);

    expect(pref.getBool('working'), false);
    expect(pref.getString('name'), 'john');
  });
}
