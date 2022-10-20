import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kapi/data/kavita/api/image_service.dart';
import 'package:kapi/data/kavita/api/library_service.dart';
import 'package:kapi/data/kavita/api/reader_service.dart';
import 'package:kapi/data/kavita/api/series_service.dart';
import 'package:kapi/data/kavita/models/login_dto/preferences.dart';
// import 'package:kapi/data/kavita/models/kavitaUser.dart';
import 'package:kapi/data/models/server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/kavitaUser.dart';
import '../models/login_dto/login_dto.dart';
import 'account_service.dart';

class ApiClient {
  static ApiClient? _apiClient;
  late AccountService accountService;
  late LibraryService libraryService;
  late SeriesService seriesService;
  late ImageService imageService;
  late ReaderService readerService;

  late Dio dio;

  ApiClient._();

  factory ApiClient() {
    _apiClient ??= ApiClient._();
    return _apiClient!;
  }

  static init() async {
    String userKey = 'kavita-user';
    String lastLoginKey = 'kavita-lastlogin';
    late KavitaUser user;
    final prefs = await SharedPreferences.getInstance();
    final Server server =
        Server.fromJson(jsonDecode(prefs.getString('Current Server')!));
    // if (prefs.getString(userKey) != null) {
    //   user = KavitaUser.fromJson(jsonDecode(prefs.getString(userKey)!));
    // } else {
    final _accountService =
        AccountService(Dio(BaseOptions(baseUrl: server.url)));
    final LoginDto _loginDto = await _accountService
        .login({"username": server.username, "password": server.password});

    user = KavitaUser(
        username: _loginDto.username.toString(),
        token: _loginDto.token.toString(),
        refreshToken: _loginDto.refreshToken.toString(),
        // preferences: Preferences.fromJson(_loginDto.preferences!.toJson()),
        apiKey: _loginDto.apiKey.toString(),
        email: _loginDto.email.toString());

    await prefs.setString(userKey, jsonEncode(user));
    await prefs.setString(lastLoginKey, user.username);
    // }

    _apiClient!.dio = Dio(
      BaseOptions(
        baseUrl: server.url,
        headers: {'Authorization': 'Bearer ${user.token}'},
      ),
    );

    _apiClient!.accountService = AccountService(_apiClient!.dio);
    _apiClient!.libraryService = LibraryService(_apiClient!.dio);
    _apiClient!.seriesService = SeriesService(_apiClient!.dio);
    _apiClient!.imageService = ImageService(_apiClient!.dio);
    _apiClient!.readerService = ReaderService(_apiClient!.dio);
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
