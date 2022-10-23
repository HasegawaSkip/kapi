import 'package:kapi/data/kavita/models/kavitaUser.dart';
import '../../data/models/server.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../kavita/api/api_client.dart';

class ServerRepository {
  Uuid uuid = const Uuid();

  Future<List<Server>> getAllServers() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    keys.remove('Current Server');
    keys.remove('kavita-lastlogin');
    keys.remove('kavita-user');
    // final prefsMap = <String, dynamic>{};
    // for (String key in keys) {
    //   prefsMap[key] = prefs.get(key);

    //   print(Server.fromJson(jsonDecode(prefsMap[key])));
    // }
    // return keys.map((e) => Server.fromJson(prefsMap[e])).toList();
    return keys
        .map((key) => Server.fromJson(jsonDecode(prefs.getString(key)!)))
        .toList();

    // return prefsMap.keys.map((e) => Server.fromJson(e).toList());

    // List<String> allPairs = await prefs.getStringList('servers')!;
    // List<Map<String, dynamic>> serverJsons =
    //     allPairs.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
    // return serverJsons.map((e) => Server.fromJson(e)).toList();
  }

  Future<bool> addServer(Server server) async {
    final prefs = await SharedPreferences.getInstance();
    String serverString = jsonEncode(server.toJson());

    return await prefs.setString(server.key, serverString);
  }

  Future<bool> removeServer(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  Future<void> setCurrentServer(Server server) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('Current Server');
    await prefs.setString('Current Server', jsonEncode(server));
    ApiClient.init();
  }

  Future<String?> getCurrentServer() async {
    final prefs = await SharedPreferences.getInstance();
    String? currentServer = prefs.getString('Current Server');
    return currentServer;
  }
}
