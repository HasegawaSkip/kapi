// ignore_for_file: no_leading_underscores_for_local_identifiers

// import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';
import '../models/kavitaUser.dart';
import '../models/loginDto.dart';
// import '../models/user.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class AccountRepository {
  ApiClient apiClient = ApiClient();

  final String userKey = 'kavita-user';
  final String lastLoginKey = 'kavita-lastlogin';
  //final Map<String, dynamic> loginData;
  // {
  //   "username": "YOUR_USERNAME",
  //   "password": "YOUR_PASSWORD"
  // };

  AccountRepository();

  login(loginData) async {
    ApiClient.init();

    LoginDto _loginDto = await apiClient.accountService.login(loginData);
    return _loginDto;
  }

  Future<void> setCurrentUser(KavitaUser user) async {
    final prefs = await SharedPreferences.getInstance();
    String userKey = 'kavita-user';
    String lastLoginKey = 'kavita-lastlogin';

    await prefs.setString(userKey, user.toString());
    await prefs.setString(lastLoginKey, user.username);
  }
}
