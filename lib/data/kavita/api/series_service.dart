import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../models/loginDto.dart';

part 'series_service.g.dart';

@RestApi()
abstract class SeriesService {
  factory SeriesService(Dio dio, {String baseUrl}) = _SeriesService;

  @POST("/api/Series/all")
  Future<LoginDto> getAllSeries(@Body() Map<String, dynamic> body);

  @POST("/api/Series?libraryId={libraryId}")
  Future<LoginDto> getSeriesForLibrary(@Path("libraryId") String libraryId);
}
