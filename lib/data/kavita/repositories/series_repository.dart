// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:kapi/data/kavita/models/recently_added_item_dto/recently_added_item_dto.dart';
import 'package:kapi/data/kavita/models/series.dart';
import 'package:kapi/data/kavita/models/series_detail.dart';
import 'package:kapi/data/kavita/models/series_detail/chapter.dart';
import 'package:kapi/data/kavita/models/series_metadata.dart';

import '../api/api_client.dart';

class SeriesRepository {
  ApiClient apiClient = ApiClient();

  SeriesRepository();

  Future<List<Series>> getSeriesForLibrary(int libraryId) async {
    return await apiClient.seriesService.getSeriesForLibrary(libraryId, {});
  }

  Future<SeriesMetadata> getMetadata(int seriesId) async {
    return await apiClient.seriesService.getMetadata(seriesId);
  }

  Future<SeriesDetail> getSeriesDetail(int seriesId) async {
    return await apiClient.seriesService.getSeriesDetail(seriesId);
  }

  Future<List<Series>> getOnDeck() async {
    return await apiClient.seriesService.getOnDeck({});
  }

  Future<List<RecentlyAddedItemDto>> getRecentlyUpdatedSeries() async {
    // await ApiClient.init();
    return await apiClient.seriesService.getRecentlyUpdatedSeries();
  }

  Future<List<Series>> getRecentlyAdded() async {
    return await apiClient.seriesService.getRecentlyAdded({});
  }

  Future<Chapter> getChapter(int chapterId) async {
    return await apiClient.seriesService.getChapter(chapterId);
  }

  Future<Series> getSeries(int seriesId) async {
    return await apiClient.seriesService.getSeries(seriesId);
  }
}
