import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kapi/data/kavita/api/library_service.dart';
import 'package:kapi/data/kavita/models/kavitaUser.dart';
import 'package:kapi/data/models/server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_dto/login_dto.dart';
import 'account_service.dart';

class ApiClient {
  static ApiClient? _apiClient;
  late AccountService accountService;
  late LibraryService libraryService;
  late Dio dio;

  ApiClient._();

  factory ApiClient() {
    _apiClient ??= ApiClient._();
    return _apiClient!;
  }

  static init() async {
    String userKey = 'kavita-user';
    // String lastLoginKey = 'kavita-lastlogin';

    final prefs = await SharedPreferences.getInstance();
    final Server server =
        Server.fromJson(jsonDecode(prefs.getString('Current Server')!));

    final LoginDto _loginDto =
        await AccountService(Dio(BaseOptions(baseUrl: server.url)))
            .login({"username": server.username, "password": server.password});
    // final KavitaUser user =
    //     KavitaUser.fromJson(jsonDecode(prefs.getString(userKey)!));

    _apiClient!.dio = Dio(
      BaseOptions(
        baseUrl: server.url,
        headers: {'Authorization': 'Bearer ${_loginDto.token}'},
      ),
    );

    _apiClient!.accountService = AccountService(_apiClient!.dio);
    _apiClient!.libraryService = LibraryService(_apiClient!.dio);
  }
}

  // baseUrl = environment.apiUrl;
  // userKey = 'kavita-user';
  // public lastLoginKey = 'kavita-lastlogin';
  // currentUser: User | undefined;

  //   setCurrentUser(user?: User) {
  //   if (user) {
  //     user.roles = [];
  //     const roles = this.getDecodedToken(user.token).role;
  //     Array.isArray(roles) ? user.roles = roles : user.roles.push(roles);

  //     localStorage.setItem(this.userKey, JSON.stringify(user));
  //     localStorage.setItem(this.lastLoginKey, user.username);
  //     if (user.preferences && user.preferences.theme) {
  //       this.themeService.setTheme(user.preferences.theme.name);
  //     } else {
  //       this.themeService.setTheme(this.themeService.defaultTheme);
  //     }
  //   } else {
  //     this.themeService.setTheme(this.themeService.defaultTheme);
  //   }

  //   this.currentUser = user;
  //   this.currentUserSource.next(user);
    
  //   if (this.currentUser !== undefined) {
  //     this.startRefreshTokenTimer();
  //   } else {
  //     this.stopRefreshTokenTimer();
  //   }
  // }