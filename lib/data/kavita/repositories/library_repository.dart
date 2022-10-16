// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:kapi/data/kavita/models/libraryDto.dart';

import '../api/api_client.dart';

class LibraryRepository {
  ApiClient apiClient = ApiClient();

  LibraryRepository();
//  private libraryNames: {[key:number]: string} | undefined = undefined;
//   private libraryTypes: {[key: number]: LibraryType} | undefined = undefined;

  // var libraryNames = <String, dynamic>{};

  Future<List<LibraryDto>> getLibraryNames() async {
    await ApiClient.init();
    return await apiClient.libraryService.getLibraryNames();
  }
}

// getLibraryNames() {
//   if (this.libraryNames != undefined) {
//     return of(this.libraryNames);
//   }
//   return this.httpClient.get<Library[]>(this.baseUrl + 'library').pipe(map(l => {
//     this.libraryNames = {};
//     l.forEach(lib => {
//       if (this.libraryNames !== undefined) {
//         this.libraryNames[lib.id] = lib.name;
//       }
//     });
//     return this.libraryNames;
//   }));
// }
