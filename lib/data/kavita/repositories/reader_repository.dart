// ignore_for_file: no_leading_underscores_for_local_identifiers

import '../api/api_client.dart';

class ReaderRepository {
  ApiClient apiClient = ApiClient();

  ReaderRepository();

  Future<List<int>> getPageUrl(
      {required int chapterId, required int page}) async {
    return await apiClient.readerService
        .getPageUrl(chapterId: chapterId, page: page);
  }
}
