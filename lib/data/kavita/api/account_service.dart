import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../models/loginDto.dart';

part 'account_service.g.dart';

@RestApi()
abstract class AccountService {
  factory AccountService(Dio dio, {String baseUrl}) = _AccountService;

  @POST("/api/Account/login")
  Future<LoginDto> login(@Body() Map<String, dynamic> body);
}
