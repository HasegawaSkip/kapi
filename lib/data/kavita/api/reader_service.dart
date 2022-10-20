import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'reader_service.g.dart';

@RestApi()
abstract class ReaderService {
  factory ReaderService(Dio dio, {String baseUrl}) = _ReaderService;

  // @Headers(<String, String>{"accept": "*/*"})
  @DioResponseType(ResponseType.bytes)
  @GET("/api/reader/image")
  Future<List<int>> getPageUrl(
      {@Query("chapterId") required int chapterId,
      @Query("page") required int page});
}
