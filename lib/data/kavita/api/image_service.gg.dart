// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ImageService implements ImageService {
  _ImageService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<String> getSeriesCoverImage(seriesId) async {
    return '${_dio.options.baseUrl}/api/Image/series-cover?seriesId=${seriesId}';
  }

  @override
  Future<String> getVolumeCoverImage(volumeId) async {
    return '${_dio.options.baseUrl}/api/Image/volume-cover?volumeId=${volumeId}';
  }

  @override
  Future<String> getChapterCoverImage(chapterId) async {
    return '${_dio.options.baseUrl}/api/Image/chapter-cover?chapterId=${chapterId}';
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
