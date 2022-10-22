// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:kapi/data/kavita/models/series.dart';

import '../api/api_client.dart';

class ImageRepository {
  ApiClient apiClient = ApiClient();

  ImageRepository();

  Future getSeriesCoverImage(int seriesId) async {
    String imageUrl =
        await apiClient.imageService.getSeriesCoverImage(seriesId);
    return imageUrl;
  }
}
