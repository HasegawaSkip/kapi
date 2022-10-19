// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:kapi/data/kavita/models/series.dart';
import 'package:kapi/data/kavita/models/series_detail.dart';
import 'package:kapi/data/kavita/models/series_metadata.dart';

import '../api/api_client.dart';

class SeriesRepository {
  ApiClient apiClient = ApiClient();

  SeriesRepository();

  Future<List<Series>> getSeriesForLibrary(int libraryId) async {
    return await apiClient.seriesService.getSeriesForLibrary(libraryId, {});
  }

  Future<SeriesMetadata> getMetadata(int seriesId) async {
    return apiClient.seriesService.getMetadata(seriesId);
  }

  Future<SeriesDetail> getSeriesDetail(int seriesId) async {
    return apiClient.seriesService.getSeriesDetail(seriesId);
  }
}
