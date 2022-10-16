import 'package:dio/dio.dart' hide Headers;
import '../models/libraryDto.dart';

import 'package:retrofit/retrofit.dart';

part 'library_service.g.dart';

@RestApi()
abstract class LibraryService {
  factory LibraryService(Dio dio, {String baseUrl}) = _LibraryService;

  @GET("/api/Library")
  Future<List<LibraryDto>> getLibraryNames();
}
