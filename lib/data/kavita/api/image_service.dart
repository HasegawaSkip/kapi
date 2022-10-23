import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'image_service.gg.dart';

@RestApi()
abstract class ImageService {
  factory ImageService(Dio dio, {String baseUrl}) = _ImageService;

  @GET("/api/Image/series-cover")
  Future<String> getSeriesCoverImage(@Query("seriesId") int seriesId);
  // ByteData
  // return '${_dio.options.baseUrl}/api/Image/series-cover?seriesId=${seriesId}';
  @GET("/api/Image/volume-cover")
  Future<String> getVolumeCoverImage(@Query("volumeId") int volumeId);

  @GET("/api/Image/chapter-cover")
  Future<String> getChapterCoverImage(@Query("chapterId") int chapterId);
}
