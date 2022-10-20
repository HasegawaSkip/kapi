import 'package:dio/dio.dart' hide Headers;
import 'package:kapi/data/kavita/models/recently_added_item_dto/recently_added_item_dto.dart';
import 'package:kapi/data/kavita/models/series.dart';
import 'package:kapi/data/kavita/models/series_detail.dart';
import 'package:kapi/data/kavita/models/series_metadata.dart';
import 'package:retrofit/retrofit.dart';

part 'series_service.g.dart';

@RestApi()
abstract class SeriesService {
  factory SeriesService(Dio dio, {String baseUrl}) = _SeriesService;

  @POST("/api/Series/all?PageSize=20")
  Future<List<Series>> getAllSeries(@Query("libraryId") int libraryId);

  @POST("/api/Series?PageSize=20")
  // @POST("/api/Series?libraryId={libraryId}")
  Future<List<Series>> getSeriesForLibrary(
      @Query("libraryId") int libraryId, @Body() Map<String, dynamic> body);

  @GET("/api/Series/metadata")
  Future<SeriesMetadata> getMetadata(@Query("seriesId") int seriesId);

  @GET("/api/Series/series-detail")
  Future<SeriesDetail> getSeriesDetail(@Query("seriesId") int seriesId);
// Get a special DTO for Series Detail page.
// Do not rely on this API externally. May change without hesitation.

  @POST("/api/Series/recently-updated-series")
  Future<List<RecentlyAddedItemDto>> getRecentlyUpdatedSeries();
  // @Query("libraryId") int? libraryId);

  @POST("/api/Series/recently-added?PageNumber=1&PageSize=30&libraryId=0")
  Future<List<Series>> getRecentlyAdded(@Body() Map<String, dynamic> body);
  //recently-added?PageNumber=1&PageSize=30&libraryId=0'
}

  // getRecentlyAdded(libraryId: number = 0, pageNum?: number, itemsPerPage?: number, filter?: SeriesFilter) {
  //   const data = this.filterUtilitySerivce.createSeriesFilter(filter);
  //   let params = new HttpParams();
  //   params = this.utilityService.addPaginationIfExists(params, pageNum, itemsPerPage);

  //   return this.httpClient.post<Series[]>(this.baseUrl + 'series/recently-added?libraryId=' + libraryId, data, {observe: 'response', params}).pipe(
  //     map(response => {
  //       return this.utilityService.createPaginatedResult(response, new PaginatedResult<Series[]>());
  //     })
  //   );
  // }
