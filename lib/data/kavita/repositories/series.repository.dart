// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:kapi/data/kavita/models/series.dart';

import '../api/api_client.dart';

class SeriesRepository {
  ApiClient apiClient = ApiClient();

  SeriesRepository();

  Future<List<Series>> getSeriesForLibrary(int libraryId) async {
    return await apiClient.seriesService.getSeriesForLibrary(libraryId, {});
  }
}
