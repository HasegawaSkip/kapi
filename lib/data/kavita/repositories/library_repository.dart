// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:kapi/data/kavita/models/libraryDto.dart';

import '../api/api_client.dart';

class LibraryRepository {
  ApiClient apiClient = ApiClient();

  final String userKey = 'kavita-user';
  final String lastLoginKey = 'kavita-lastlogin';
  //final Map<String, dynamic> loginData;
  // {
  //   "username": "YOUR_USERNAME",
  //   "password": "YOUR_PASSWORD"
  // };

  LibraryRepository();

  Future<LibraryDto> getLibraryNames() {}
}
