import 'package:dio/dio.dart' hide Headers;
import 'package:kapi/data/kavita/models/series.dart';
import 'package:kapi/data/kavita/models/series_detail.dart';
import 'package:kapi/data/kavita/models/series_metadata.dart';
import 'package:retrofit/retrofit.dart';

part 'series_service.g.dart';

@RestApi()
abstract class SeriesService {
  factory SeriesService(Dio dio, {String baseUrl}) = _SeriesService;

  @POST("/api/Series/all?libraryId={libraryId}&PageSize=10")
  Future<List<Series>> getAllSeries(@Path("libraryId") int libraryId);

  @POST("/api/Series?libraryId={libraryId}&PageSize=20")
  // @POST("/api/Series?libraryId={libraryId}")
  Future<List<Series>> getSeriesForLibrary(
      @Path("libraryId") int libraryId, @Body() Map<String, dynamic> body);

  @GET("/api/Series/metadata?seriesId={seriesId}")
  Future<SeriesMetadata> getMetadata(@Path("seriesId") int seriesId);

  @GET("/api/Series/series-detail?seriesId={seriesId}")
  Future<SeriesDetail> getSeriesDetail(@Path("seriesId") int seriesId);
// Get a special DTO for Series Detail page.
// Do not rely on this API externally. May change without hesitation.

}
