import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'image_service.gg.dart';

@RestApi()
abstract class ImageService {
  factory ImageService(Dio dio, {String baseUrl}) = _ImageService;
  @GET("/api/Image/series-cover?seriesId={seriesId}")
  Future<String> getSeriesCoverImage(@Path("seriesId") int seriesId);
  // return '${_dio.options.baseUrl}/api/Image/series-cover?seriesId=${seriesId}';
}
