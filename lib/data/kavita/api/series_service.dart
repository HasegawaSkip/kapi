import 'package:dio/dio.dart' hide Headers;
import 'package:kapi/data/kavita/models/series/series.dart';
import 'package:retrofit/retrofit.dart';

import '../models/loginDto.dart';

part 'series_service.g.dart';

@RestApi()
abstract class SeriesService {
  factory SeriesService(Dio dio, {String baseUrl}) = _SeriesService;

  @POST("/api/Series/all?libraryId={libraryId}&PageSize=10")
  Future<List<Series>> getAllSeries(@Path("libraryId") int libraryId);

  @POST("/api/Series?libraryId={libraryId}&PageSize=10")
  Future<List<Series>> getSeriesForLibrary(
      @Path("libraryId") int libraryId, @Body() Map<String, dynamic> body);
}
