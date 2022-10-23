// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:kapi/data/kavita/models/series.dart';

import '../api/api_client.dart';

class ImageRepository {
  ApiClient apiClient = ApiClient();

  ImageRepository();

  Future<String> getSeriesCoverImage(int seriesId) async {
    return await apiClient.imageService.getSeriesCoverImage(seriesId);
  }

  Future<String> getVolumeCoverImage(int volumeId) async {
    return await apiClient.imageService.getVolumeCoverImage(volumeId);
  }

  Future<String> getChapterCoverImage(int chapterId) async {
    return await apiClient.imageService.getChapterCoverImage(chapterId);
  }
}
